package com.luo.domain.activity.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivityCountEntity {

    private Long activityCountId;

    private Integer totalCount;

    private Integer monthCount;

    private Integer dayCount;

}
