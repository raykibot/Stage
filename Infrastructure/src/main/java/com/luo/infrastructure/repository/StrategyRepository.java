package com.luo.infrastructure.repository;


import com.luo.domain.strategy.model.entity.StrategyAwardEntity;
import com.luo.domain.strategy.model.entity.StrategyEntity;
import com.luo.domain.strategy.model.entity.StrategyRuleEntity;
import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.infrastructure.dao.IStrategyAwardDAO;
import com.luo.infrastructure.dao.IStrategyDAO;
import com.luo.infrastructure.dao.IStrategyRuleDAO;
import com.luo.infrastructure.pojo.Strategy;
import com.luo.infrastructure.pojo.StrategyAward;
import com.luo.infrastructure.pojo.StrategyRule;
import com.luo.infrastructure.redis.IRedisService;
import com.luo.type.constants.Commons;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j
@Repository
public class StrategyRepository implements IStrategyRepository {


    @Autowired
    private IRedisService redisService;

    @Autowired
    private IStrategyAwardDAO strategyAwardDAO;

    @Autowired
    private IStrategyDAO strategyDAO;

    @Autowired
    private IStrategyRuleDAO strategyRuleDAO;



    @Override
    public void setCacheAwardIds(String strategyId, List<Integer> awardIds, int size) {
        //抽奖范围存储
        String rangeKey = Commons.RedisKey.STRATEGY_AWARD_RATE_RANGE_KEY + strategyId ;
        redisService.setValue(rangeKey, size);

        //奖品查找表存储
        String rateTableKey = Commons.RedisKey.STRATEGY_AWARD_RATE_TABLE_KEY + strategyId;
        redisService.setValue(rateTableKey,awardIds);
    }

    @Override
    public void setCacheAwardCount(String caCheKey, Integer awardCount) {
        //存储奖品id库存信息 原子性操作
        redisService.setActomicLongValue(caCheKey,awardCount);
    }

    @Override
    public List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId) {

        //查询奖品配置
        List<StrategyAward> strategyAwardList = strategyAwardDAO.queryStrategyAwardList(strategyId);
        //类型转换
        List<StrategyAwardEntity> strategyAwardEntityList = new ArrayList<>();
        for (StrategyAward strategyAward : strategyAwardList) {
            StrategyAwardEntity build = StrategyAwardEntity.builder()
                    .awardId(strategyAward.getAwardId())
                    .awardTitle(strategyAward.getAwardTitle())
                    .awardSubtitle(strategyAward.getAwardSubtitle())
                    .awardCount(strategyAward.getAwardCount())
                    .awardCountSurplus(strategyAward.getAwardCountSurplus())
                    .awardRate(strategyAward.getAwardRate())
                    .sort(strategyAward.getSort())
                    .build();
            strategyAwardEntityList.add(build);
        }
        return strategyAwardEntityList;
    }

    @Override
    public StrategyEntity queryStrategyEntityByStrategyId(Long strategyId) {
        Strategy strategy = strategyDAO.queryStrategyEntityByStrategyId(strategyId);
        return StrategyEntity.builder()
                .strategyId(strategy.getStrategyId())
                .strategyDesc(strategy.getStrategyDesc())
                .ruleModels(strategy.getRuleModels())
                .build();
    }

    @Override
    public StrategyRuleEntity queryStrategyRuleEntity(String ruleWeight) {
        StrategyRule strategyRule = strategyRuleDAO.queryStrategyRuleEntity(ruleWeight);

        return StrategyRuleEntity.builder()
                .strategyId(strategyRule.getStrategyId())
                .ruleModel(strategyRule.getRuleModel())
                .awardId(strategyRule.getAwardId())
                .ruleDesc(strategyRule.getRuleDesc())
                .ruleValue(strategyRule.getRuleValue())
                .build();
    }

    @Override
    public int getRateRange(Long strategyId) {
        String caCheKey = Commons.RedisKey.STRATEGY_AWARD_RATE_RANGE_KEY+strategyId;
        return redisService.getValue(caCheKey);
    }

    @Override
    public Integer getAwardRandom(int index, Long strategyId) {
        String value = String.valueOf(strategyId);
        String caCheKey = Commons.RedisKey.STRATEGY_AWARD_RATE_TABLE_KEY+value;
        List<Integer> awardList =  redisService.getValue(caCheKey);
        return awardList.get(index);
    }

    @Override
    public Integer getAwardRandomByRuleWeight(String caCheKey) {
        String rateRange_RuleWeight = Commons.RedisKey.STRATEGY_AWARD_RATE_RANGE_KEY+caCheKey;
        Integer rateRange = redisService.getValue(rateRange_RuleWeight);
        log.info("rateRange：{}",rateRange);

        String key = Commons.RedisKey.STRATEGY_AWARD_RATE_TABLE_KEY+caCheKey;
        List<Integer> awardList =  redisService.getValue(key);
        return awardList.get(new Random().nextInt(rateRange));
    }

    @Override
    public String queryRuleValue(Long strategyId, String ruleModel) {
        return strategyRuleDAO.queryRuleValue(strategyId,ruleModel);
    }
}
