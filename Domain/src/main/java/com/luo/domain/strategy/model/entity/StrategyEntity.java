package com.luo.domain.strategy.model.entity;

import com.luo.type.constants.Commons;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class StrategyEntity {

    private Long strategyId;

    private String strategyDesc;

    //rule_blacklist,rule_weight
    private String ruleModels;



    public String[] getRuleModels(){
        if (this.ruleModels.isBlank()){
            return null;
        }
        return this.ruleModels.split(Commons.COMMA);
    }


    public String getRuleWeight(){
        if (this.ruleModels.isBlank()){
            return  null;
        }
        for (String ruleModel : getRuleModels()) {
            if (ruleModel.equals("rule_weight")){
                return ruleModel;
            }
        }
        return null;
    }



}
