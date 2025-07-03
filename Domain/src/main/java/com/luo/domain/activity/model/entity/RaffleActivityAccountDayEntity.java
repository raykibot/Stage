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
public class RaffleActivityAccountDayEntity {

    private String userId;

    private Long activityId;

    private String day;

    private Integer dayCount;

    private Integer dayCountSurplus;
}
