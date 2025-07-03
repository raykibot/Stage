package com.luo.domain.rebate.service;

import com.luo.domain.rebate.model.entity.BehaviorEntity;

import java.util.List;

/**
 * 行为返利服务接口
 */
public interface IBehaviorRebateService {

    List<String> createOrderIds(BehaviorEntity behaviorEntity);


}
