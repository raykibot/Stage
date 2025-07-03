package com.luo.domain.activity.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivityAccountEntity {

    private String userId;

    private Long activityId;

    private Integer totalCount;

    private Integer totalCountSurplus;

    private Integer monthCount;

    private Integer monthCountSurplus;

    private Integer dayCount;

    private Integer dayCountSurplus;
}
