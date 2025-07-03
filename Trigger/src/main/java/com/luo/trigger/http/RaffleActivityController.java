package com.luo.trigger.http;

import com.alibaba.fastjson2.JSON;
import com.luo.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.luo.domain.activity.model.entity.SkuRechargeEntity;
import com.luo.domain.activity.model.entity.UserRaffleOrderEntity;
import com.luo.domain.activity.service.IRaffleActivityAccountQuotaService;
import com.luo.domain.activity.service.IRaffleActivityPartakeService;
import com.luo.domain.activity.service.armory.IActivityArmory;
import com.luo.domain.award.model.entity.UserAwardRecordEntity;
import com.luo.domain.award.model.vo.AwardStateVO;
import com.luo.domain.award.service.IAwardService;
import com.luo.domain.rebate.model.entity.BehaviorEntity;
import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import com.luo.domain.rebate.service.IBehaviorRebateService;
import com.luo.domain.strategy.model.entity.RaffleAwardEntity;
import com.luo.domain.strategy.model.entity.RaffleFactorEntity;
import com.luo.domain.strategy.service.IRaffleStrategy;
import com.luo.domain.strategy.service.armory.IAssembleArmory;
import com.luo.trigger.api.IRaffleActivityService;
import com.luo.trigger.api.dto.ActivityDrawRequestDTO;
import com.luo.trigger.api.dto.ActivityDrawResponseDTO;
import com.luo.type.enums.ResponseCode;
import com.luo.type.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
@CrossOrigin("${app.config.cross-origin}")
@RestController
@RequestMapping("/api/${app.config.api-version}/raffle/activity")
public class RaffleActivityController implements IRaffleActivityService {

    private final SimpleDateFormat dateFormatDay = new SimpleDateFormat("yyyyMMdd");

    @Autowired
    private IActivityArmory activityArmory;

    @Autowired
    private IAssembleArmory strategyArmory;

    @Autowired
    private IBehaviorRebateService behaviorRebateService;

    @Autowired
    private IRaffleActivityPartakeService raffleActivityPartakeService;

    @Autowired
    private IRaffleStrategy raffleStrategy;

    @Autowired
    private IAwardService awardService;

    @Autowired
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;


    @RequestMapping(value = "armory", method = RequestMethod.GET)
    @Override
    public Response<Boolean> armory(@RequestParam  Long activityId) {

        try {
            log.info("活动装配，数据预热，开始 activityId:{}", activityId);
            // 活动装配
            activityArmory.assembleActivitySkuByActivityId(activityId);
            // 策略装配
            strategyArmory.strategyAssembleByActivityId(activityId);
            Response<Boolean> response = Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .msg(ResponseCode.SUCCESS.getInfo())
                    .data(true)
                    .build();
            log.info("活动装配，数据预热，完成 activityId:{}", activityId);
            return response;
        } catch (Exception e) {
            log.error("活动装配，数据预热，失败 activityId:{}", activityId, e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.FAIL.getCode())
                    .msg(ResponseCode.FAIL.getInfo())
                    .build();
        }
    }

    @RequestMapping(value = "draw", method = RequestMethod.POST)
    @Override
    public Response<ActivityDrawResponseDTO> draw(@RequestBody ActivityDrawRequestDTO request) {

        try {
            log.info("活动抽奖 userId:{} activityId:{}", request.getUserId(), request.getActivityId());
            //1. 参数校验
            if (StringUtils.isBlank(request.getUserId()) || null == request.getActivityId()) {
                throw new RuntimeException("参数异常");
            }

            //2. 参与活动 - 创建参与记录订单
            PartakeRaffleActivityEntity partakeRaffleActivityEntity = new PartakeRaffleActivityEntity(request.getUserId(), request.getActivityId());
            partakeRaffleActivityEntity.setUserId(request.getUserId());
            partakeRaffleActivityEntity.setActivityId(request.getActivityId());
            UserRaffleOrderEntity userRaffleOrder = raffleActivityPartakeService.createOrder(partakeRaffleActivityEntity);

            //3. 抽奖策略 - 执行抽奖
            RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(RaffleFactorEntity.builder()
                    .strategyId(userRaffleOrder.getStrategyId())
                    .userId(userRaffleOrder.getUserId())
                    .build());

            //4. 抽奖结果 -写入中将记录
            UserAwardRecordEntity userAwardRecordEntity = new UserAwardRecordEntity();
            userAwardRecordEntity.setUserId(userRaffleOrder.getUserId());
            userAwardRecordEntity.setActivityId(userRaffleOrder.getActivityId());
            userAwardRecordEntity.setStrategyId(userRaffleOrder.getStrategyId());
            userAwardRecordEntity.setAwardId(raffleAwardEntity.getAwardId());
            userAwardRecordEntity.setOrderId(userRaffleOrder.getOrderId());
            userAwardRecordEntity.setAwardTitle(raffleAwardEntity.getAwardTitle());
            userAwardRecordEntity.setOrderTime(new Date());
            userAwardRecordEntity.setAwardState(AwardStateVO.create);
            awardService.saveUserAwardRecord(userAwardRecordEntity);

            //5. 返回结果
            return Response.<ActivityDrawResponseDTO>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .msg(ResponseCode.SUCCESS.getInfo())
                    .data(ActivityDrawResponseDTO.builder()
                            .awardTitle(raffleAwardEntity.getAwardTitle())
                            .awardIndex(raffleAwardEntity.getSort())
                            .awardId(raffleAwardEntity.getAwardId())
                            .build())
                    .build();
        } catch (RuntimeException e) {
            log.error("活动抽奖失败 userId:{} activityId:{}", request.getUserId(), request.getActivityId(), e);
            return Response.<ActivityDrawResponseDTO>builder()
                    .code(ResponseCode.FAIL.getCode())
                    .msg(ResponseCode.FAIL.getInfo())
                    .build();
        }


    }

    @RequestMapping(value = "calendar_sign_rebate", method = RequestMethod.POST)
    @Override
    public Response<Boolean> calendarSignRebate(@RequestBody String userId) {
        try {
            log.info("日历签到返利开始 userId:{}", userId);
            BehaviorEntity behaviorEntity = new BehaviorEntity();
            behaviorEntity.setUserId(userId);
            behaviorEntity.setBehaviorType(BehaviorTypeVO.SIGN);
            behaviorEntity.setOutBusinessNo(dateFormatDay.format(new Date()));
            List<String> orderIds = behaviorRebateService.createOrderIds(behaviorEntity);
            log.info("日历签到返利完成 userId:{} orderIds: {}", userId, JSON.toJSONString(orderIds));
            return Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .msg(ResponseCode.SUCCESS.getInfo())
                    .data(true)
                    .build();
        } catch (Exception e) {
            log.error("日历签到返利失败 userId:{}", userId);
            return Response.<Boolean>builder()
                    .code(ResponseCode.FAIL.getCode())
                    .msg(ResponseCode.FAIL.getInfo())
                    .data(false)
                    .build();
        }
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    @Override
    public Response<Boolean> addNewUser(@RequestParam String userId, @RequestParam String type) {

        try {
            SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
            skuRechargeEntity.setSku(9011);
            if (type.equals("grid")){
                skuRechargeEntity.setSku(9022);
            }
            skuRechargeEntity.setUserId(userId);
            skuRechargeEntity.setOutBusinessOutNo(RandomStringUtils.randomNumeric(12));
            String order = raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
            if (order != null && !order.isEmpty()){
                return Response.<Boolean>builder()
                        .code(ResponseCode.SUCCESS.getCode())
                        .msg(ResponseCode.SUCCESS.getInfo())
                        .data(true)
                        .build();
            }
            return Response.<Boolean>builder()
                    .code(ResponseCode.FAIL.getCode())
                    .msg(ResponseCode.FAIL.getInfo())
                    .data(false)
                    .build();
        } catch (Exception e) {
            log.error("添加用户失败 userId:{}", userId);
            return Response.<Boolean>builder()
                    .code(ResponseCode.FAIL.getCode())
                    .msg(ResponseCode.FAIL.getInfo())
                    .data(false)
                    .build();
        }
    }


}
