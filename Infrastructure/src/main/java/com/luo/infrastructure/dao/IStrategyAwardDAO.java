package com.luo.infrastructure.dao;


import com.luo.infrastructure.pojo.StrategyAward;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IStrategyAwardDAO {


    List<StrategyAward> queryStrategyAwardList(Long strategyId);

    StrategyAward queryStrategyAward(StrategyAward strategyAwardReq);

    String queryRuleModel(StrategyAward strategyAward);

    void updateStrategyAwardStock(StrategyAward strategyAward);
}
