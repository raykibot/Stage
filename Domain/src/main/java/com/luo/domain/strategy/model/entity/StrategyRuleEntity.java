package com.luo.domain.strategy.model.entity;

import com.luo.type.constants.Commons;
import lombok.Builder;
import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
@Builder
public class StrategyRuleEntity {


    private Long strategyId;

    private Integer awardId;

    private String ruleModel;

    private String ruleValue;

    private String ruleDesc;



    //处理ruleValue 1000:102,103,104,105,106 2000:102,103,104,105,106,107 3000:102,103,104,105,106,107,108,109
    public Map<String, List<Integer>> getRuleValue(){

        Map<String, List<Integer>> map = new HashMap<>();

        //[1000:102,103,104,105,106, 2000:102,103,104,105,106,107, 3000:102,103,104,105,106,107,108,109]
        String[] ruleValueGroups = this.ruleValue.split(Commons.SPACE);

        for (String ruleValueGroup : ruleValueGroups) {
            // 例如： 1000:102,103,104,105,106
            String[] ruleWeight = ruleValueGroup.split(Commons.COLON);
            if (ruleWeight.length!=2){
                throw new RuntimeException("ruleWeight error");
            }
            List<Integer> awardIdList = new ArrayList<>();
            String[] awardIds = ruleWeight[1].split(Commons.COMMA);
            for (String awardId : awardIds) {
                awardIdList.add(Integer.valueOf(awardId));
            }
            map.put(ruleValueGroup,awardIdList);
        }
        return map;
    }



}
