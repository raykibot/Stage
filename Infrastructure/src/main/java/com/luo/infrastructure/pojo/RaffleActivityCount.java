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
public class RaffleActivityCount {


    private Long id;

    private Long activityCountId;

    private Integer totalCount;

    private Integer dayCount;

    private Integer monthCount;

    private Date createTime;

    private Date updateTime;

}
