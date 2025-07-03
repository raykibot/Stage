package com.luo.domain.rebate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DailyBehaviorRebateVO {


    private String behaviorType;

    private String rebateDesc;

    private String rebateType;

    private String rebateConfig;

    private String state;

}
