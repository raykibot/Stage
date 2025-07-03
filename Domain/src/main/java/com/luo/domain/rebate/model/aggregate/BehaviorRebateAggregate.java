package com.luo.domain.rebate.model.aggregate;

import com.luo.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import com.luo.domain.rebate.model.entity.TaskEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 行为返利聚合对象
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BehaviorRebateAggregate {

    private String userId;

    //行为返利实体订单对象
    private BehaviorRebateOrderEntity behaviorRebateOrderEntity;

    //任务实体对象
    private TaskEntity taskEntity;


}
