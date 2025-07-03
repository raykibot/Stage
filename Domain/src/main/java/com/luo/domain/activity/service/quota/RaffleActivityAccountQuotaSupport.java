package com.luo.domain.activity.service.quota;

import com.luo.domain.activity.model.entity.RaffleActivityCountEntity;
import com.luo.domain.activity.model.entity.RaffleActivityEntity;
import com.luo.domain.activity.model.entity.RaffleActivitySkuEntity;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.domain.activity.service.quota.rule.factory.DefaultActionChainFactory;

public class RaffleActivityAccountQuotaSupport {


    protected final IActivityRepository activityRepository;

    protected final DefaultActionChainFactory defaultActionChainFactory;

   public RaffleActivityAccountQuotaSupport(IActivityRepository activityRepository, DefaultActionChainFactory defaultActionChainFactory) {
        this.activityRepository = activityRepository;
        this.defaultActionChainFactory = defaultActionChainFactory;
    }


    public RaffleActivitySkuEntity queryRaffleActivityEntityBySku(Integer sku){
        return activityRepository.queryRaffleActivityEntityBySku(sku);
    }

    public RaffleActivityEntity queryRaffleActivityEntityByActivityId(Long activityId){
       return activityRepository.queryRaffleActivityEntityByActivityId(activityId);
    }

    public RaffleActivityCountEntity queryRaffleActivityCountEntityByActivityCountId(Long activityCountId){
       return activityRepository.queryRaffleActivityCountEntityByActivityCountId(activityCountId);
    }
}
