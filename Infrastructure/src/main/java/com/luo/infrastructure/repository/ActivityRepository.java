package com.luo.infrastructure.repository;

import com.luo.domain.activity.event.ActivitySkuStockZeroMessageEvent;
import com.luo.domain.activity.model.aggregate.CreatQuotaOrderAggregate;
import com.luo.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import com.luo.domain.activity.model.entity.*;
import com.luo.domain.activity.model.vo.ActivitySkuStockVO;
import com.luo.domain.activity.model.vo.UserRaffleStateVO;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.infrastructure.dao.*;
import com.luo.infrastructure.event.EventPublisher;
import com.luo.infrastructure.pojo.*;
import com.luo.infrastructure.redis.IRedisService;
import com.luo.type.constants.Commons;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBlockingQueue;
import org.redisson.api.RDelayedQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
@Repository
public class ActivityRepository implements IActivityRepository {

    @Autowired
    private IRedisService redisService;

    @Autowired
    private IRaffleActivityOrderDAO raffleActivityOrderDAO;

    @Autowired
    private IRaffleActivityAccountDAO raffleActivityAccountDAO;

    @Autowired
    private IRaffleActivitySkuDAO raffleActivitySkuDAO;

    @Autowired
    private IRaffleActivityCountDAO raffleActivityCountDAO;

    @Autowired
    private IRaffleActivityDAO raffleActivityDAO;

    @Autowired
    private IUserRaffleOrderDAO userRaffleOrderDAO;

    @Autowired
    private IRaffleActivityAccountDayDAO raffleActivityAccountDayDAO;

    @Autowired
    private IRaffleActivityAccountMonthDAO raffleActivityAccountMonthDAO;

    @Autowired
    private EventPublisher eventPublisher;

    @Autowired
    private ActivitySkuStockZeroMessageEvent activitySkuStockZeroMessageEvent;


    @Override
    public void activitySkuConsumeSendQueue(ActivitySkuStockVO build) {
        String caCheKey = Commons.RedisKey.ACTIVITY_SKU_COUNT_QUERY_KEY;
        RBlockingQueue<ActivitySkuStockVO> blockingDeque = redisService.getBlockingDeque(caCheKey);
        RDelayedQueue<ActivitySkuStockVO> delayedQueue = redisService.getDelayedQueue(blockingDeque);
        delayedQueue.offer(build, 3, TimeUnit.SECONDS);
    }


    @Override
    public Boolean subtractStock(Integer sku, String caCheKey, Date endDateTime) {
        long surplus = redisService.decr(caCheKey);
        if (surplus == 0) {
            //todo 库存为0 发送MQ消息
            eventPublisher.publish(activitySkuStockZeroMessageEvent.topic(), activitySkuStockZeroMessageEvent.build(sku));
        } else if (surplus < 0) {
            redisService.setActomicLongValue(caCheKey, 0);
        }
        String lockKey = caCheKey + Commons.UNDERLINE + surplus;
        long expireTime = endDateTime.getTime() - System.currentTimeMillis() + TimeUnit.DAYS.toMillis(1);
        Boolean status = redisService.setNx(lockKey, expireTime, TimeUnit.MILLISECONDS);
        if (!status) {
            log.info("活动sku库存上锁失败");
        }
        return status;
    }

    @Transactional
    @Override
    public void savOrder(CreatQuotaOrderAggregate createQuotaOrderAggregate) {

        //raffle_activity_order 活动订单表对象
        RaffleActivityOrderEntity raffleActivityOrderEntity = createQuotaOrderAggregate.getRaffleActivityOrderEntity();
        RaffleActivityOrder raffleActivityOrder = new RaffleActivityOrder();
        raffleActivityOrder.setUserId(raffleActivityOrderEntity.getUserId());
        raffleActivityOrder.setSku(raffleActivityOrderEntity.getSku());
        raffleActivityOrder.setActivityId(raffleActivityOrderEntity.getActivityId());
        raffleActivityOrder.setActivityName(raffleActivityOrderEntity.getActivityName());
        raffleActivityOrder.setStrategyId(raffleActivityOrderEntity.getStrategyId());
        raffleActivityOrder.setOrderId(raffleActivityOrderEntity.getOrderId());
        raffleActivityOrder.setOrderTime(raffleActivityOrderEntity.getOrderTime());
        raffleActivityOrder.setTotalCount(raffleActivityOrderEntity.getTotalCount());
        raffleActivityOrder.setDayCount(raffleActivityOrderEntity.getDayCount());
        raffleActivityOrder.setMonthCount(raffleActivityOrderEntity.getMonthCount());
        raffleActivityOrder.setState(raffleActivityOrderEntity.getState().getCode());
        raffleActivityOrder.setOutBusinessNo(raffleActivityOrderEntity.getOutBusinessNo());

        // raffle_activity_account 用户账户表对象  总
        RaffleActivityAccount raffleActivityAccount = new RaffleActivityAccount();
        raffleActivityAccount.setUserId(createQuotaOrderAggregate.getUserId());
        raffleActivityAccount.setActivityId(createQuotaOrderAggregate.getActivityId());
        raffleActivityAccount.setTotalCount(createQuotaOrderAggregate.getTotalCount());
        raffleActivityAccount.setTotalCountSurplus(createQuotaOrderAggregate.getTotalCount());
        raffleActivityAccount.setMonthCount(createQuotaOrderAggregate.getMonthCount());
        raffleActivityAccount.setMonthCountSurplus(createQuotaOrderAggregate.getMonthCount());
        raffleActivityAccount.setDayCount(createQuotaOrderAggregate.getDayCount());
        raffleActivityAccount.setDayCountSurplus(createQuotaOrderAggregate.getDayCount());

        // raffle_activity_account_month 用户账户表对象  月
        RaffleActivityAccountMonth monthAccount = new RaffleActivityAccountMonth();
        monthAccount.setUserId(createQuotaOrderAggregate.getUserId());
        monthAccount.setActivityId(createQuotaOrderAggregate.getActivityId());
        monthAccount.setMonth(monthAccount.currentTime());
        monthAccount.setMonthCount(createQuotaOrderAggregate.getMonthCount());
        monthAccount.setMonthCountSurplus(createQuotaOrderAggregate.getMonthCount());

        // raffle_activity_account_day 用户账户表对象  日
        RaffleActivityAccountDay dayAccount = new RaffleActivityAccountDay();
        dayAccount.setUserId(createQuotaOrderAggregate.getUserId());
        dayAccount.setActivityId(createQuotaOrderAggregate.getActivityId());
        dayAccount.setDay(dayAccount.currentTime());
        dayAccount.setDayCount(createQuotaOrderAggregate.getDayCount());
        dayAccount.setDayCountSurplus(createQuotaOrderAggregate.getDayCount());

        try {
            //写入活动订单
            raffleActivityOrderDAO.insert(raffleActivityOrder);

            //更新活动账户
            int status = raffleActivityAccountDAO.updateAccount(raffleActivityAccount);

            //没有则status为0 则不存在账户 执行创建账户
            if (status == 0) {
                raffleActivityAccountDAO.insert(raffleActivityAccount);
            }

            //更新月账户
            raffleActivityAccountMonthDAO.addAccountQuota(monthAccount);

            //更新日账户
            raffleActivityAccountDayDAO.addAccountQuota(dayAccount);

        } catch (Exception e) {
            log.error(e.getMessage());
            log.info(" 唯一索引冲突 out_business_no :{}",raffleActivityOrder.getOutBusinessNo());
            throw new RuntimeException("活动订单写入失败 " );
        }
    }

    @Override
    public List<RaffleActivitySkuEntity> queryRaffleActivitySkuListByActivityId(Long activityId) {

        List<RaffleActivitySku> list = raffleActivitySkuDAO.queryRaffleActivitySkuListByActivityId(activityId);
        List<RaffleActivitySkuEntity> result = new ArrayList<>(list.size());
        for (RaffleActivitySku raffleActivitySku : list) {
            RaffleActivitySkuEntity entity = RaffleActivitySkuEntity.builder()
                    .activityId(raffleActivitySku.getActivityId())
                    .activityCountId(raffleActivitySku.getActivityCountId())
                    .sku(raffleActivitySku.getSku())
                    .stockCount(raffleActivitySku.getStockCount())
                    .stockCountSurplus(raffleActivitySku.getStockCountSurplus())
                    .build();
            result.add(entity);
        }
        return result;
    }

    @Override
    public RaffleActivityCountEntity queryRaffleActivityCountEntityByActivityCountId(Long activityCountId) {

        //优先从redis中获取
        String caCheKey = Commons.RedisKey.ACTIVITY_COUNT_KEY + activityCountId;
        RaffleActivityCountEntity raffleActivityCountEntity = redisService.getValue(caCheKey);
        if (raffleActivityCountEntity != null) {
            return raffleActivityCountEntity;
        }

        RaffleActivityCount raffleActivityCount = raffleActivityCountDAO.queryRaffleActivityCountByActivityCountId(activityCountId);


        raffleActivityCountEntity = RaffleActivityCountEntity.builder()
                .activityCountId(raffleActivityCount.getActivityCountId())
                .totalCount(raffleActivityCount.getTotalCount())
                .monthCount(raffleActivityCount.getMonthCount())
                .dayCount(raffleActivityCount.getDayCount())
                .build();
        redisService.setValue(caCheKey, raffleActivityCountEntity);
        return raffleActivityCountEntity;
    }

    @Override
    public RaffleActivityEntity queryRaffleActivityEntityByActivityId(Long activityId) {

        //优先redis中获取
        String caCheKey = Commons.RedisKey.ACTIVITY_KEY + activityId;
        RaffleActivityEntity raffleActivityEntity = redisService.getValue(caCheKey);
        if (raffleActivityEntity != null) {
            return raffleActivityEntity;
        }

        RaffleActivity raffleActivity = raffleActivityDAO.queryRaffleActivityEntityByActivityId(activityId);

        raffleActivityEntity = RaffleActivityEntity.builder()
                .activityId(raffleActivity.getActivityId())
                .activityName(raffleActivity.getActivityName())
                .activityDesc(raffleActivity.getActivityDesc())
                .beginDateTime(raffleActivity.getBeginDateTime())
                .endDateTime(raffleActivity.getEndDateTime())
                .strategyId(raffleActivity.getStrategyId())
                .state(raffleActivity.getState())
                .build();
        redisService.setValue(caCheKey, raffleActivityEntity);
        return raffleActivityEntity;
    }

    @Override
    public void caChKeyRaffleActivitySkuStockCount(String caCheKey, Integer count) {
        if (redisService.isExists(caCheKey)) return;
        redisService.setActomicLongValue(caCheKey, count);
    }

    @Override
    public RaffleActivitySkuEntity queryRaffleActivityEntityBySku(Integer sku) {

        RaffleActivitySku raffleActivitySku = raffleActivitySkuDAO.queryRaffleActivityBySku(sku);
        String caCheKey = Commons.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        Long caCheSkuStock = redisService.getAtomicLong(caCheKey);
        if (caCheSkuStock == null || caCheSkuStock == 0L) {
            caCheSkuStock = 0L;
        }
        return RaffleActivitySkuEntity.builder()
                .sku(raffleActivitySku.getSku())
                .activityId(raffleActivitySku.getActivityId())
                .activityCountId(raffleActivitySku.getActivityCountId())
                .stockCount(raffleActivitySku.getStockCount())
                .stockCountSurplus(raffleActivitySku.getStockCountSurplus())
                .build();
    }

    @Override
    public void clearActivitySkuStock(Integer sku) {
        raffleActivitySkuDAO.clearActivitySkuStock(sku);
    }

    @Override
    public void clearQueueValue() {
        String caCheKey = Commons.RedisKey.ACTIVITY_SKU_COUNT_QUERY_KEY;
        RBlockingQueue<ActivitySkuStockVO> blockingDeque = redisService.getBlockingDeque(caCheKey);
        blockingDeque.clear();
    }

    @Override
    public ActivitySkuStockVO takeQueueValue() {
        String caCheKey = Commons.RedisKey.ACTIVITY_SKU_COUNT_QUERY_KEY;
        RBlockingQueue<ActivitySkuStockVO> blockingDeque = redisService.getBlockingDeque(caCheKey);
        return blockingDeque.poll();
    }

    @Override
    public void updateActivitySkuStock(Integer sku) {
        raffleActivitySkuDAO.updateActivitySkuStock(sku);
    }

    @Override
    public UserRaffleOrderEntity queryNoUsedRaffleOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity) {

        String userId = partakeRaffleActivityEntity.getUserId();
        Long activityId = partakeRaffleActivityEntity.getActivityId();

        UserRaffleOrder req = new UserRaffleOrder();
        req.setUserId(userId);
        req.setActivityId(activityId);
        UserRaffleOrder userRaffleOrder = userRaffleOrderDAO.queryNoUsedRaffleOrder(req);
        if (userRaffleOrder == null) {
            //为空则说明没有未使用订单
            return null;
        }
        return UserRaffleOrderEntity.builder()
                .userId(userRaffleOrder.getUserId())
                .activityId(userRaffleOrder.getActivityId())
                .activityName(userRaffleOrder.getActivityName())
                .strategyId(userRaffleOrder.getStrategyId())
                .orderId(userRaffleOrder.getOrderId())
                .orderTime(userRaffleOrder.getOrderTime())
                .orderState(UserRaffleStateVO.valueOf(userRaffleOrder.getOrderState()))
                .build();
    }

    @Override
    public RaffleActivityAccountEntity queryRaffleActivityAccountEntityByuserId(String userId, Long activityId) {
        RaffleActivityAccount raffleActivityAccount = new RaffleActivityAccount();
        raffleActivityAccount.setUserId(userId);
        raffleActivityAccount.setActivityId(activityId);
        RaffleActivityAccount raffleActivityAccount1 = raffleActivityAccountDAO.queryRaffleActivityAccount(raffleActivityAccount);

        return RaffleActivityAccountEntity.builder()
                .userId(raffleActivityAccount1.getUserId())
                .activityId(raffleActivityAccount1.getActivityId())
                .totalCount(raffleActivityAccount1.getTotalCount())
                .totalCountSurplus(raffleActivityAccount1.getTotalCountSurplus())
                .monthCount(raffleActivityAccount1.getMonthCount())
                .monthCountSurplus(raffleActivityAccount1.getMonthCountSurplus())
                .dayCount(raffleActivityAccount1.getDayCount())
                .dayCountSurplus(raffleActivityAccount1.getDayCountSurplus())
                .build();
    }

    @Override
    public RaffleActivityAccountMonthEntity queryRaffleActivityAccountMonthByUserId(String userId, Long activityId, String month) {
        RaffleActivityAccountMonth req = new RaffleActivityAccountMonth();
        req.setUserId(userId);
        req.setActivityId(activityId);
        req.setMonth(month);

        RaffleActivityAccountMonth raffleActivityAccountMonth = raffleActivityAccountMonthDAO.queryRaffleActivityAccountMonthByUserId(req);
        if (raffleActivityAccountMonth == null) return null;
        return RaffleActivityAccountMonthEntity.builder()
                .userId(raffleActivityAccountMonth.getUserId())
                .activityId(raffleActivityAccountMonth.getActivityId())
                .month(raffleActivityAccountMonth.getMonth())
                .monthCount(raffleActivityAccountMonth.getMonthCount())
                .monthCountSurplus(raffleActivityAccountMonth.getMonthCountSurplus())
                .build();
    }

    @Override
    public RaffleActivityAccountDayEntity queryRaffleActivityAccountDayByUserId(String userId, Long activityId, String day) {
        RaffleActivityAccountDay req = new RaffleActivityAccountDay();
        req.setUserId(userId);
        req.setActivityId(activityId);
        req.setDay(day);

        RaffleActivityAccountDay raffleActivityAccountDay = raffleActivityAccountDayDAO.queryRaffleActivityAccountDayByUserId(req);
        if (raffleActivityAccountDay == null) return null;
        return RaffleActivityAccountDayEntity.builder()
                .userId(raffleActivityAccountDay.getUserId())
                .activityId(raffleActivityAccountDay.getActivityId())
                .day(raffleActivityAccountDay.getDay())
                .dayCount(raffleActivityAccountDay.getDayCount())
                .dayCountSurplus(raffleActivityAccountDay.getDayCountSurplus())
                .build();
    }

    @Transactional
    @Override
    public void saveCreatePartakeOrderAggregate(CreatePartakeOrderAggregate createPartakeOrderAggregate) {

        String userId = createPartakeOrderAggregate.getUserId();
        Long activityId = createPartakeOrderAggregate.getActivityId();
        RaffleActivityAccountEntity raffleActivityAccountEntity = createPartakeOrderAggregate.getRaffleActivityAccountEntity();
        RaffleActivityAccountMonthEntity raffleActivityAccountMonthEntity = createPartakeOrderAggregate.getRaffleActivityAccountMonthEntity();
        RaffleActivityAccountDayEntity raffleActivityAccountDayEntity = createPartakeOrderAggregate.getRaffleActivityAccountDayEntity();
        UserRaffleOrderEntity userRaffleOrder = createPartakeOrderAggregate.getUserRaffleOrder();


        try {
            //更新总账户
            int count = raffleActivityAccountDAO.updateRaffleActivityAccount(RaffleActivityAccount.builder()
                    .userId(userId)
                    .activityId(activityId)
                    .build());

            if (count != 1) {
                throw new RuntimeException("总账户余额不足");
            }

            //创建或更新月账户
            if (createPartakeOrderAggregate.isMonthAccount()) {
                //存在月账户 更新
                int status = raffleActivityAccountMonthDAO.updateRaffleActivityAccountMonth(RaffleActivityAccountMonth
                        .builder()
                        .userId(userId)
                        .activityId(activityId)
                        .month(raffleActivityAccountMonthEntity.getMonth())
                        .build());

                if (status != 1) {
                    throw new RuntimeException("月账户余额不足");
                }
                //更新总账户中月账户库存
                raffleActivityAccountDAO.updateAccountMonthCountSurplus(RaffleActivityAccount.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .build());
            } else {
                //创建月账户
                raffleActivityAccountMonthDAO.insertRaffleActivityAccountMonth(RaffleActivityAccountMonth.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .month(raffleActivityAccountMonthEntity.getMonth())
                        .monthCount(raffleActivityAccountMonthEntity.getMonthCount())
                        .monthCountSurplus(raffleActivityAccountMonthEntity.getMonthCountSurplus() - 1)
                        .build());

                //更新总账户中月账户库存
                raffleActivityAccountDAO.updateAccountMonthCountSurplusImage(RaffleActivityAccount.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .monthCountSurplus(raffleActivityAccountEntity.getMonthCountSurplus())
                        .build());
            }

            //创建或更新日账户
            if (createPartakeOrderAggregate.isDayAccount()) {
                //存在日账户 更新
                int status = raffleActivityAccountDayDAO.updateRaffleActivityAccountDay(RaffleActivityAccountDay.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .day(raffleActivityAccountDayEntity.getDay())
                        .build());

                if (status != 1) {
                    throw new RuntimeException("日账户余额不足");
                }
                //更新总账户中日账户库存
                raffleActivityAccountDAO.updateAccountDayCountSurplusImage(RaffleActivityAccount.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .dayCountSurplus(raffleActivityAccountEntity.getDayCountSurplus())
                        .build());
            } else {
                //创建日账户
                raffleActivityAccountDayDAO.insertRaffleActivityAccountDay(RaffleActivityAccountDay.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .day(raffleActivityAccountDayEntity.getDay())
                        .dayCount(raffleActivityAccountDayEntity.getDayCount())
                        .dayCountSurplus(raffleActivityAccountDayEntity.getDayCountSurplus() - 1)
                        .build());

                //更新总账户中日账户库存
                raffleActivityAccountDAO.updateAccountDayCountSurplusImage(RaffleActivityAccount.builder()
                        .userId(userId)
                        .activityId(activityId)
                        .dayCountSurplus(raffleActivityAccountEntity.getDayCountSurplus())
                        .build());
            }

            //写入参与活动订单
            userRaffleOrderDAO.insert(UserRaffleOrder.builder()
                    .userId(userId)
                    .activityId(activityId)
                    .activityName(userRaffleOrder.getActivityName())
                    .strategyId(userRaffleOrder.getStrategyId())
                    .orderId(userRaffleOrder.getOrderId())
                    .orderTime(userRaffleOrder.getOrderTime())
                    .orderState(userRaffleOrder.getOrderState().getCode())
                    .build());
        } catch (RuntimeException e) {
            log.error("保存用户参与活动订单异常", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public Integer queryRaffleActivityAccountDayCount(Long activityId, String userId) {

        RaffleActivityAccountDay raffleActivityAccountDay = new RaffleActivityAccountDay();
        raffleActivityAccountDay.setActivityId(activityId);
        raffleActivityAccountDay.setUserId(userId);
        raffleActivityAccountDay.setDay(raffleActivityAccountDay.currentTime());

        Integer dayCount = raffleActivityAccountDayDAO.queryRaffleActivityAccountDayCount(raffleActivityAccountDay);

        return dayCount == null ? 0 : dayCount;
    }
}
