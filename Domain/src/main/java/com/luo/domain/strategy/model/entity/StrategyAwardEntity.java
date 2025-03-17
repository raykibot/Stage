package com.luo.domain.strategy.model.entity;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Builder
public class StrategyAwardEntity {

    private Long strategyId;

    private Integer awardId;

    private String awardTitle;

    private String awardSubtitle;

    private Integer awardCount;

    private Integer awardCountSurplus;

    private BigDecimal awardRate;

    private Integer sort;

}
