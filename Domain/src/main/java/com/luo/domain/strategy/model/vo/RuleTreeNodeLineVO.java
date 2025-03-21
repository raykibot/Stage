package com.luo.domain.strategy.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeNodeLineVO {

    private String treeId;

    private String ruleNodeFrom;

    private String ruleNodeTo;

    //限定类型
    private RuleLimitTypeVO ruleLimitType;

    //到达下一个节点限定值
    private RuleLogicCheckTypeVO ruleLogicCheckTypeVO;

}
