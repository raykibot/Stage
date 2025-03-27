package com.luo.domain.strategy.model.entity;

import com.luo.type.constants.Commons;
import lombok.Builder;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

@Data
@Builder
public class StrategyEntity {

    private Long strategyId;

    private String strategyDesc;

    //rule_blacklist,rule_weight
    private String ruleModels;



    public String[] getRuleModels(){
        if (StringUtils.isBlank(ruleModels)){
            return null;
        }
        return ruleModels.split(Commons.COMMA);
    }


    public String getRuleWeight(){

        //这个jdk自带的判断会导致 空指针报错
//        if (ruleModels.isBlank()){
//            return  null;
//        }

        //使用org.apache.commons.lang3.StringUtils.isBlank() 可以防止空指针报错
        if (StringUtils.isBlank(ruleModels)) return null;

        for (String ruleModel : getRuleModels()) {
            if (ruleModel.equals("rule_weight")){
                return ruleModel;
            }
        }
        return null;
    }



}
