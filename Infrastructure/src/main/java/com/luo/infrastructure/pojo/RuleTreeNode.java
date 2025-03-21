package com.luo.infrastructure.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeNode {

    private Long id;

    private String treeId;

    private String ruleKey;

    private String ruleDesc;

    private String ruleValue;

    private Date createTime;

    private Date updateTime;

}
