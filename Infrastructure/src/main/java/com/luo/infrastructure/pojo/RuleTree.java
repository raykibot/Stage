package com.luo.infrastructure.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RuleTree {


    private Long id;

    private String treeId;

    private String treeName;

    private String treeDesc;

    private String treeRootRuleKey;

    private Date createTime;

    private Date updateTime;








}
