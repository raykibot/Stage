package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.StrategyRule;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IStrategyRuleDAO {

    StrategyRule queryStrategyRuleEntity(String ruleWeight);

    String queryRuleValue(Long strategyId, String ruleModel);
}
