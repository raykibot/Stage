package com.luo.infrastructure.pojo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class StrategyAward {

    private Long strategyId;

    private Integer awardId;

    private String awardTitle;

    private String awardSubtitle;

    private Integer awardCount;

    private Integer awardCountSurplus;

    private BigDecimal awardRate;

    private Integer sort;

    private String ruleModels;

    private Date createTime;

    private Date updateTime;
}
