package com.luo.domain.activity.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivitySkuEntity {


    private Integer sku;

    private Long activityId;

    private Long activityCountId;

    private Integer stockCount;

    private Integer stockCountSurplus;

}
