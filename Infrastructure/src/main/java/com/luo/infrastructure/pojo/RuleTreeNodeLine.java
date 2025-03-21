package com.luo.infrastructure.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeNodeLine {


    private Long id;

    private String treeId;

    private String ruleNodeFrom;

    private String ruleNodeTo;

    private String ruleLimitType;

    private String ruleLimitValue;

    private Date createTime;

    private Date updateTime;

}
