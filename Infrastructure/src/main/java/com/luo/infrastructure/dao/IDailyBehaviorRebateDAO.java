package com.luo.infrastructure.dao;

import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import com.luo.infrastructure.pojo.DailyBehaviorRebate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IDailyBehaviorRebateDAO {


    List<DailyBehaviorRebate> queryDailyRebateConfig(String code);
}
