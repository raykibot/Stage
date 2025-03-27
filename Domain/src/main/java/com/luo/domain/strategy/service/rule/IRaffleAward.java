package com.luo.domain.strategy.service.rule;

import com.luo.domain.strategy.model.entity.StrategyAwardEntity;

import java.util.List;

public interface IRaffleAward {


    /**
     * 根据策略id查询奖品列表
     * @param strategyId 策略id
     * @return 奖品列表
     */
    List<StrategyAwardEntity> queryRaffleStaregyAwardList(Long strategyId);

}
