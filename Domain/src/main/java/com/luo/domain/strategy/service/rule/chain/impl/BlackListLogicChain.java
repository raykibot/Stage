package com.luo.domain.strategy.service.rule.chain.impl;

import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.rule.chain.AbstractLogicChain;


import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.type.constants.Commons;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BlackListLogicChain extends AbstractLogicChain {

    @Autowired
    private IStrategyRepository strategyRepository;

    @Override
    public DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId) {
        String ruleValue = strategyRepository.queryRuleValue(strategyId,ruleModel());
        String[] split1 = ruleValue.split(Commons.COLON);
        Integer awardId = Integer.valueOf(split1[0]);

        String[] split2 = split1[1].split(Commons.COMMA);
        for (String id : split2) {
            if (userId.equals(id)){
                return DefaultChainFactory.StrategyAwardVO.builder()
                        .awardId(awardId)
                        .ruleModel(ruleModel())
                        .build();
            }
        }

        //不是黑名单成员 去往下一节点
        return next().logic(userId,strategyId);

    }

    @Override
    protected String ruleModel() {
        return DefaultChainFactory.LogicModel.BLACK_LIST.getCode();
    }
}
