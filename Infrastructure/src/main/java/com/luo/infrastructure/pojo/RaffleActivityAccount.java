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
public class RaffleActivityAccount {

    private Long id;

    private String userId;

    private Long activityId;

    private Integer totalCount;

    private Integer totalCountSurplus;

    private Integer monthCount;

    private Integer monthCountSurplus;

    private Integer dayCount;

    private Integer dayCountSurplus;

    private Date createTime;

    private Date updateTime;
}
