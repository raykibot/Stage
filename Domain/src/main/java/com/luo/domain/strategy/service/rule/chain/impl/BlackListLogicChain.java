package com.luo.domain.strategy.service.rule.chain.impl;

import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.rule.chain.AbstractLogicChain;


import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.type.constants.Commons;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.logging.LoggersEndpoint;
import org.springframework.stereotype.Component;

@Component("rule_blacklist")
@Slf4j
public class BlackListLogicChain extends AbstractLogicChain {

    @Autowired
    private IStrategyRepository strategyRepository;

    @Override
    public DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId) {

        log.info("责任链校验-黑名单检查 userId:{} strategyId:{} ", userId,strategyId);

        String ruleValue = strategyRepository.queryRuleValue(strategyId,ruleModel());
//        if (ruleValue == null){
//            return next().logic(userId,strategyId);
//        }
        String[] split1 = ruleValue.split(Commons.COLON);

        Integer awardId = Integer.valueOf(split1[0]);


        String[] split2 = split1[1].split(Commons.COMMA);
        for (String id : split2) {
            if (userId.equals(id)){
                log.info("责任链校验-黑名单接管 userId:{} strategyId:{}",userId,strategyId);
                return DefaultChainFactory.StrategyAwardVO.builder()
                        .awardId(awardId)
                        .ruleModel(ruleModel())
                        .build();
            }
        }

        log.info("责任链校验-黑名单放行 userId:{} strategyId:{}", userId, strategyId);
        //不是黑名单成员 去往下一节点
        return next().logic(userId,strategyId);
    }

    @Override
    protected String ruleModel() {
        return DefaultChainFactory.LogicModel.BLACK_LIST.getCode();
    }
}
