package com.luo.domain.strategy.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeNodeVO {

    private String treeId;

    private String ruleKey;

    private String ruleDesc;

    private String ruleValue;

    //规则连线集合
    private List<RuleTreeNodeLineVO> ruleTreeNodeLineVOList;
}
