package com.luo.infrastructure.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivitySku {

    private Long id;

    private Integer sku;

    private Long activityId;

    private Long activityCountId;

    private Integer stockCount;

    private Integer stockCountSurplus;

    private Date createTime;

    private Date updateTime;

}
