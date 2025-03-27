package com.luo.domain.strategy.service.rule.chain.factory;

import com.luo.domain.strategy.model.entity.StrategyEntity;
import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.rule.chain.ILogicChain;
import lombok.*;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
public class DefaultChainFactory {


    private final Map<String, ILogicChain> chainGroups;

    protected IStrategyRepository strategyRepository ;

    public DefaultChainFactory(Map<String, ILogicChain> chainGroups, IStrategyRepository strategyRepository) {
        this.chainGroups = chainGroups;
        this.strategyRepository = strategyRepository;
    }



    public ILogicChain openChain(Long strategyId){

        //获取该策略id所配置的过滤规则
        StrategyEntity strategyEntity = strategyRepository.queryStrategyEntityByStrategyId(strategyId);
        String [] ruleModels = strategyEntity.getRuleModels();

        //未配置规则  装配默认规则
        if (null == ruleModels || ruleModels.length == 0){
            return chainGroups.get(LogicModel.DEFAULT.getCode());
        }

        //获取头节点
        ILogicChain iLogicChain = chainGroups.get(ruleModels[0]);

        //这里的赋值操作是将 current 变量指向 logicChain 所指向的同一个对象（头节点），而不是创建一个新对象。
        ILogicChain current = iLogicChain;
        for (int i = 1; i < ruleModels.length; i++) {
            ILogicChain next = chainGroups.get(ruleModels[i]);
            current = current.appendNext(next);
        }

        //装配默认规则
        current.appendNext(chainGroups.get(LogicModel.DEFAULT.getCode()));

        //返回头节点
        return iLogicChain;
    }











    /**
     * 只做内部流转使用
     */
    @Data
    @Builder
    public static class StrategyAwardVO{

        private Integer awardId;

        private String ruleModel;
    }






    @Getter
    @AllArgsConstructor
    public enum LogicModel{

        RULE_WEIGHT("rule_weight","权重抽奖"),
        BLACK_LIST("rule_blacklist","黑名单抽奖"),
        DEFAULT("rule_default","默认抽奖"),
        ;

        private String code;

        private String info;

    }

}
