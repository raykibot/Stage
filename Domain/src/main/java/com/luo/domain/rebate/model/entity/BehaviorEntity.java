package com.luo.domain.rebate.model.entity;

import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 行为实体对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BehaviorEntity {


    //用户id
    private String userId;

    //行为类型
    private BehaviorTypeVO behaviorType;

    //业务id
    private String outBusinessNo;

}
