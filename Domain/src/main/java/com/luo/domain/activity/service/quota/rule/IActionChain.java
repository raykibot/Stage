package com.luo.domain.activity.service.quota.rule;

import com.luo.domain.activity.model.entity.RaffleActivityCountEntity;
import com.luo.domain.activity.model.entity.RaffleActivityEntity;
import com.luo.domain.activity.model.entity.RaffleActivitySkuEntity;

public interface IActionChain extends IActionChainArmory{

    boolean action(RaffleActivityEntity activityEntity, RaffleActivitySkuEntity raffleActivitySkuEntity, RaffleActivityCountEntity raffleActivityCountEntity);


}
