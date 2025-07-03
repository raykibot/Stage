package com.luo.domain.strategy.service;

import java.util.Map;

public interface IRaffleRule {


    Map<String, Integer> queryRuleLockCount(String[] treeIds);

}
