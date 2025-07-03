package com.luo.infrastructure.pojo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 行为返利订单实体对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BehaviorRebateOrder {

    private Long id;

    private String userId;

    private String orderId;

    private String behaviorType;

    private String rebateDesc;

    private String rebateType;

    private String rebateConfig;

    private String bizId;

    private Date createTime;

    private Date updateTime;

}
