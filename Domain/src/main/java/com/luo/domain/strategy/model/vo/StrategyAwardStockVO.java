package com.luo.domain.strategy.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyAwardStockVO implements Serializable {

    private Long strategyId;

    private Integer awardId;

}
