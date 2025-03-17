package com.luo.domain.strategy.service.rule.chain;


import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.domain.strategy.service.rule.chain.impl.DefaultLogicChain;

/**
 * 责任链规则接口
 */
public interface ILogicChain extends ILogicChainArmory{


    /**
     * 责任链开启
     * @param userId
     * @param strategyId
     */
    DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId);




}
