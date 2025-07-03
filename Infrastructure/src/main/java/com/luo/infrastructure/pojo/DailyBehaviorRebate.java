package com.luo.infrastructure.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DailyBehaviorRebate {

    private Long id;

    private String behaviorType;

    private String rebateDesc;

    private String rebateType;

    private String rebateConfig;

    private String state;

    private Date createTime;

    private Date updateTime;
}
