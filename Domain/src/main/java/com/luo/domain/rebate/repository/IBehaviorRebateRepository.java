package com.luo.domain.rebate.repository;

import com.luo.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import com.luo.domain.rebate.model.vo.DailyBehaviorRebateVO;

import java.util.List;

public interface IBehaviorRebateRepository {


    List<DailyBehaviorRebateVO> queryDailyRebateConfig(BehaviorTypeVO behaviorType);

    void saveBehaviorRebateAggregate(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates);
}
