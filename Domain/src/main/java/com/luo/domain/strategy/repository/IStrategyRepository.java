package com.luo.domain.strategy.repository;

import com.luo.domain.strategy.model.entity.StrategyAwardEntity;
import com.luo.domain.strategy.model.entity.StrategyEntity;
import com.luo.domain.strategy.model.entity.StrategyRuleEntity;

import java.util.List;

public interface IStrategyRepository {
    void setCacheAwardIds(String strategyId, List<Integer> awardIds, int size);

    void setCacheAwardCount(String caCheKey, Integer awardCount);

    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    StrategyEntity queryStrategyEntityByStrategyId(Long strategyId);

    StrategyRuleEntity queryStrategyRuleEntity(String ruleWeight);

    int getRateRange(Long strategyId);

    Integer getAwardRandom(int index,Long strategyId);

    Integer getAwardRandomByRuleWeight(String caCheKey);

    String queryRuleValue(Long strategyId, String ruleModel);
}
