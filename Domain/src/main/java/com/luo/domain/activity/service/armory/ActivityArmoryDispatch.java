package com.luo.domain.activity.service.armory;

import com.luo.domain.activity.model.entity.RaffleActivitySkuEntity;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.type.constants.Commons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ActivityArmoryDispatch implements IActivityDispatch, IActivityArmory {


    @Autowired
    private IActivityRepository activityRepository;

    @Override
    public Boolean subtractStock(Integer sku, Date endDateTime) {

        String caCheKey = Commons.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;

        return activityRepository.subtractStock(sku, caCheKey, endDateTime);
    }

    @Override
    public boolean assembleActivitySkuByActivityId(Long activityId) {

        List<RaffleActivitySkuEntity> list = activityRepository.queryRaffleActivitySkuListByActivityId(activityId);
        for (RaffleActivitySkuEntity raffleActivitySkuEntity : list) {
            caCheRaffleActivitySkuStockCount(raffleActivitySkuEntity.getSku(), raffleActivitySkuEntity.getStockCountSurplus());

            // 预热活动次数---raffle_activity_count【查询时缓存到redis】
            activityRepository.queryRaffleActivityCountEntityByActivityCountId(raffleActivitySkuEntity.getActivityCountId());
        }

        //预热活动---raffle_activity【查询时缓存到redis】
        activityRepository.queryRaffleActivityEntityByActivityId(activityId);

        return true;
    }

    private void caCheRaffleActivitySkuStockCount(Integer sku, Integer count) {
        String caCheKey = Commons.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        activityRepository.caChKeyRaffleActivitySkuStockCount(caCheKey, count);
    }
}
