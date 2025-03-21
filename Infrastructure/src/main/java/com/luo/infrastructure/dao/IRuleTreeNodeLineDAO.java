package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RuleTreeNodeLine;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IRuleTreeNodeLineDAO {
    List<RuleTreeNodeLine> queryRuleTreeNodeLineVOByTreeId(String treeId);
}
