package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.BehaviorRebateOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserBehaviorRebateDAO {


    void insert(BehaviorRebateOrder behaviorRebateOrder);
}
