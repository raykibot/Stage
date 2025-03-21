package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RuleTree;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IRuleTreeDAO {
    RuleTree queryRuleTreeVOByTreeId(String treeId);
}
