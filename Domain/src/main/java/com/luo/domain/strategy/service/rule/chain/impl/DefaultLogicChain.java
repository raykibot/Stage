package com.luo.domain.strategy.service.rule.chain.impl;

import com.luo.domain.strategy.service.armory.IRaffleDispatch;
import com.luo.domain.strategy.service.rule.chain.AbstractLogicChain;
import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DefaultLogicChain extends AbstractLogicChain {

    @Autowired
    private IRaffleDispatch raffleDispatch;
    @Override
    public DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId) {

        Integer awardId = raffleDispatch.getRandomAwardId(strategyId);
        return DefaultChainFactory.StrategyAwardVO.builder()
                .awardId(awardId)
                .ruleModel(ruleModel())
                .build();
    }

    @Override
    protected String ruleModel() {
        return DefaultChainFactory.LogicModel.DEFAULT.getCode();
    }
}
