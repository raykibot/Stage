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
public class UserAwardRecord {

    private Long id;

    private String userId;

    private Long activityId;

    private Long strategyId;

    private Integer awardId;

    private String orderId;

    private String awardTitle;

    private Date orderTime;

    private String awardState;

    private Date createTime;

    private Date updateTime;

}
