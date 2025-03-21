package com.luo.domain.strategy.service.raffle;

import com.luo.domain.strategy.model.entity.StrategyAwardRuleModelVO;
import com.luo.domain.strategy.model.vo.RuleTreeVO;
import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.armory.IRaffleDispatch;
import com.luo.domain.strategy.service.rule.AbstractRaffleStrategy;
import com.luo.domain.strategy.service.rule.chain.ILogicChain;
import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import com.luo.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;

public class DefaultRaffleStrategy extends AbstractRaffleStrategy {


    public DefaultRaffleStrategy(IStrategyRepository strategyRepository, IRaffleDispatch raffleDispatch, DefaultChainFactory defaultChainFactory, DefaultTreeFactory defaultTreeFactory) {
        super(strategyRepository, raffleDispatch, defaultChainFactory, defaultTreeFactory);
    }

    /**
     * 责任链具体实现
     * @param userId
     * @param strategyId
     * @return StrategyAwardVO : awardId ruleModel
     */
    @Override
    public DefaultChainFactory.StrategyAwardVO raffleLogicChain(String userId, Long strategyId) {

        //工厂根据strategyId获取责任链
        ILogicChain iLogicChain = defaultChainFactory.openChain(strategyId);

        //责任链过滤结果 awardId ruleModel
        return iLogicChain.logic(userId, strategyId);

    }

    @Override
    public DefaultTreeFactory.StrategyAwardVO raffleLogicTree(String userId, Long strategyId, Integer awardId) {

        //查询奖品ruleModel
        StrategyAwardRuleModelVO strategyAwardRuleModelVO = strategyRepository.queryStrategyAwardRuleModel(strategyId, awardId);
        if (strategyAwardRuleModelVO == null){
            return DefaultTreeFactory.StrategyAwardVO.builder().awardId(awardId).build();
        }
        RuleTreeVO ruleTreeVO = strategyRepository.queryRuleTreeVOByTreeId(strategyAwardRuleModelVO.getRuleModel());
        if (null == ruleTreeVO){
            throw new RuntimeException("rule_tree rule_tree_node rule_tree_node_line 配置错误");
        }
        IDecisionTreeEngine decisionTreeEngine = defaultTreeFactory.openLogicTree(ruleTreeVO);
        return decisionTreeEngine.process(userId,strategyId,awardId);
    }
}
