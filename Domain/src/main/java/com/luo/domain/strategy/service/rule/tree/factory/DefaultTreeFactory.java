package com.luo.domain.strategy.service.rule.tree.factory;

import com.luo.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import com.luo.domain.strategy.model.vo.RuleTreeVO;
import com.luo.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.luo.domain.strategy.service.rule.tree.factory.engine.DecisionTreeEngine;
import com.luo.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 规则树工厂 负责提供DecisionTreeEngine接口实现对象
 */
@Service
public class DefaultTreeFactory {

    private final Map<String, ILogicTreeNode> treeNodesGroups;

    public DefaultTreeFactory(Map<String, ILogicTreeNode> treeNodesGroups) {
        this.treeNodesGroups = treeNodesGroups;
    }

    public IDecisionTreeEngine openLogicTree(RuleTreeVO ruleTreeVO){
        return new DecisionTreeEngine(treeNodesGroups, ruleTreeVO);
    }




    @Builder
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class TreeActionEntity{

        private RuleLogicCheckTypeVO ruleLogicCheckTypeVO;

        private StrategyAwardVO strategyAwardVO;
    }


    /**
     * 内部流转使用
     */
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class StrategyAwardVO{

        private Integer awardId;

        private String awardRuleValue;
    }
}
