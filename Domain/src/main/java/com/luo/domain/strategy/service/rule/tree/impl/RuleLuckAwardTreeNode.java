package com.luo.domain.strategy.service.rule.tree.impl;

import com.luo.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.luo.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import com.luo.type.constants.Commons;
import org.springframework.stereotype.Component;

@Component("rule_luck_award")
public class RuleLuckAwardTreeNode implements ILogicTreeNode {
    @Override
    public DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleValue) {


        String[] split1 = ruleValue.split(Commons.COLON);


        Integer luckAwardId = Integer.parseInt(split1[0]);

        String awardRuleValue = split1[1];

        return DefaultTreeFactory.TreeActionEntity.builder()
                .ruleLogicCheckTypeVO(RuleLogicCheckTypeVO.TAKE_OVER)
                .strategyAwardVO(DefaultTreeFactory.StrategyAwardVO.builder()
                        .awardId(luckAwardId)
                        .awardRuleValue(awardRuleValue)
                        .build())
                .build();
    }
}
