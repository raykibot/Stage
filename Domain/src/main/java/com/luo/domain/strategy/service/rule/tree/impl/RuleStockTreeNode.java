package com.luo.domain.strategy.service.rule.tree.impl;

import com.luo.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import com.luo.domain.strategy.model.vo.StrategyAwardStockVO;
import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.armory.IRaffleDispatch;
import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.luo.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component("rule_stock")
public class RuleStockTreeNode implements ILogicTreeNode {

    @Autowired
    private IStrategyRepository strategyRepository;

    @Autowired
    private IRaffleDispatch raffleDispatch;


    @Override
    public DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleValue) {


        Boolean status = raffleDispatch.subtractStock(strategyId,awardId);
        log.info("规则树校验-库存扣减");

        if (status){

//            //写入延迟队列 使用redis自带的延迟队列实现
//            strategyRepository.awardStockConsumeSendQueue(StrategyAwardStockVO.builder()
//                    .awardId(awardId)
//                    .strategyId(strategyId)
//                    .build());

            //接入rabbitmq实现
            strategyRepository.awardStockProducerWithRabbitmq(StrategyAwardStockVO.builder()
                    .awardId(awardId)
                    .strategyId(strategyId)
                    .build());

            log.info("规则树校验-库存扣减接管");
            return DefaultTreeFactory.TreeActionEntity.builder()
                    .strategyAwardVO(DefaultTreeFactory.StrategyAwardVO.builder()
                            .awardId(awardId)
                            .awardRuleValue(ruleValue)
                            .build())
                    .ruleLogicCheckTypeVO(RuleLogicCheckTypeVO.TAKE_OVER)
                    .build();
        }
        //库存扣减失败
        log.info("规则树校验-库存扣减放行");
        return DefaultTreeFactory.TreeActionEntity.builder()
                .ruleLogicCheckTypeVO(RuleLogicCheckTypeVO.ALLOW)
                .build();
    }
}
