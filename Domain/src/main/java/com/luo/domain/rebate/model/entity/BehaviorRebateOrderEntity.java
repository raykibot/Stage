package com.luo.domain.rebate.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 行为返利订单实体对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BehaviorRebateOrderEntity {


    private String userId;

    private String orderId;

    private String behaviorType;

    private String rebateDesc;

    private String rebateType;

    private String rebateConfig;

    private String bizId;

}
