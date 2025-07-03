package com.luo.domain.activity.service.quota;

import com.luo.domain.activity.model.aggregate.CreatQuotaOrderAggregate;
import com.luo.domain.activity.model.entity.*;
import com.luo.domain.activity.model.vo.ActivitySkuStockVO;
import com.luo.domain.activity.model.vo.RaffleOrderStateVO;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.domain.activity.service.IRaffleActivitySkuStockService;
import com.luo.domain.activity.service.quota.rule.factory.DefaultActionChainFactory;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class RaffleActivityAccountQuotaService extends AbstractRaffleActivityAccountQuota implements IRaffleActivitySkuStockService {


    public RaffleActivityAccountQuotaService(IActivityRepository activityRepository, DefaultActionChainFactory defaultActionChainFactory) {
        super(activityRepository, defaultActionChainFactory);
    }

    @Override
    protected CreatQuotaOrderAggregate buildCreateQuotaOrderAggregate(RaffleActivityEntity activityEntity, RaffleActivitySkuEntity raffleActivitySkuEntity, RaffleActivityCountEntity raffleActivityCountEntity, SkuRechargeEntity skuRechargeEntity) {

        //构建对象实体类
        CreatQuotaOrderAggregate creatQuotaOrderAggregate = new CreatQuotaOrderAggregate();

        creatQuotaOrderAggregate.setUserId(skuRechargeEntity.getUserId());
        creatQuotaOrderAggregate.setActivityId(activityEntity.getActivityId());
        creatQuotaOrderAggregate.setTotalCount(raffleActivityCountEntity.getTotalCount());
        creatQuotaOrderAggregate.setDayCount(raffleActivityCountEntity.getDayCount());
        creatQuotaOrderAggregate.setMonthCount(raffleActivityCountEntity.getMonthCount());

        //活动订单实体类
        RaffleActivityOrderEntity raffleActivityOrderEntity = new RaffleActivityOrderEntity();
        raffleActivityOrderEntity.setUserId(skuRechargeEntity.getUserId());
        raffleActivityOrderEntity.setSku(skuRechargeEntity.getSku());
        raffleActivityOrderEntity.setActivityId(activityEntity.getActivityId());
        raffleActivityOrderEntity.setActivityName(activityEntity.getActivityName());
        raffleActivityOrderEntity.setStrategyId(activityEntity.getStrategyId());
        raffleActivityOrderEntity.setOrderId(RandomStringUtils.randomNumeric(12));
        raffleActivityOrderEntity.setOrderTime(new Date());
        raffleActivityOrderEntity.setTotalCount(raffleActivityCountEntity.getTotalCount());
        raffleActivityOrderEntity.setDayCount(raffleActivityCountEntity.getDayCount());
        raffleActivityOrderEntity.setMonthCount(raffleActivityCountEntity.getMonthCount());
        raffleActivityOrderEntity.setState(RaffleOrderStateVO.completed);
        raffleActivityOrderEntity.setOutBusinessNo(skuRechargeEntity.getOutBusinessOutNo());

        //构建对象填充活动订单
        creatQuotaOrderAggregate.setRaffleActivityOrderEntity(raffleActivityOrderEntity);

        return creatQuotaOrderAggregate;
    }

    @Override
    protected void doSaveOrder(CreatQuotaOrderAggregate createQuotaOrderAggregate) {
        //保存订单
        activityRepository.savOrder(createQuotaOrderAggregate);
    }

    @Override
    public void clearActivitySkuStock(Integer sku) {
        activityRepository.clearActivitySkuStock(sku);
    }

    @Override
    public void clearQueueValue() {
        activityRepository.clearQueueValue();
    }

    @Override
    public void updateActivitySkuStock(Integer sku) {
        activityRepository.updateActivitySkuStock(sku);
    }

    @Override
    public ActivitySkuStockVO takeQueueValue() {
        return activityRepository.takeQueueValue();
    }

    @Override
    public Integer queryPartakeDayCount(Long activityId, String userId) {
        return activityRepository.queryRaffleActivityAccountDayCount(activityId, userId);
    }
}
