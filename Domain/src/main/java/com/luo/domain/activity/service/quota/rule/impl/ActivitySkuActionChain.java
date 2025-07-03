package com.luo.domain.activity.service.quota.rule.impl;

import com.luo.domain.activity.model.entity.RaffleActivityCountEntity;
import com.luo.domain.activity.model.entity.RaffleActivityEntity;
import com.luo.domain.activity.model.entity.RaffleActivitySkuEntity;
import com.luo.domain.activity.model.vo.ActivitySkuStockVO;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.domain.activity.service.armory.IActivityDispatch;
import com.luo.domain.activity.service.quota.rule.AbstractActivityActionChain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component("action_activity_sku")
@Slf4j
public class ActivitySkuActionChain extends AbstractActivityActionChain {


    private final IActivityDispatch activityDispatch;

    private final IActivityRepository activityRepository;

    public ActivitySkuActionChain(IActivityDispatch activityDispatch, IActivityRepository activityRepository) {
        this.activityDispatch = activityDispatch;
        this.activityRepository = activityRepository;
    }


    @Override
    public boolean action(RaffleActivityEntity activityEntity, RaffleActivitySkuEntity raffleActivitySkuEntity, RaffleActivityCountEntity raffleActivityCountEntity) {

        log.info("活动责任链---活动扣减");

        //优先扣减缓存数据库库存
        Boolean status = activityDispatch.subtractStock(raffleActivitySkuEntity.getSku(), activityEntity.getEndDateTime());
        if (status){
            log.info("活动责任链---活动库存扣减成功");

            //写入延迟队列 延迟更新数据库库存
            activityRepository.activitySkuConsumeSendQueue(ActivitySkuStockVO.builder()
                    .sku(raffleActivitySkuEntity.getSku())
                    .activityId(raffleActivitySkuEntity.getActivityId())
                    .build());

            return true;
        }
        throw new RuntimeException("活动库存扣减失败");
    }
}
