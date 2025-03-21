package com.luo.domain.strategy.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;


/**
 * 规则数对象
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeVO {

    private String treeId ;

    private String treeName;

    private String treeDesc;

    private String treeRootRuleNode;

    private Map<String, RuleTreeNodeVO> treeNodeMap;
}
