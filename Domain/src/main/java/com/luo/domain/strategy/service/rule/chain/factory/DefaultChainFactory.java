package com.luo.domain.strategy.service.rule.chain.factory;

import lombok.*;

public class DefaultChainFactory {


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
