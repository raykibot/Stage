package com.luo.domain.strategy.service.rule.chain.impl;

import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.armory.IRaffleDispatch;
import com.luo.domain.strategy.service.rule.chain.AbstractLogicChain;
import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.type.constants.Commons;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Slf4j
@Component("rule_weight")
public class RuleWeightLogicChain extends AbstractLogicChain {

    @Autowired
    private IStrategyRepository strategyRepository;

    @Autowired
    private IRaffleDispatch raffleDispatch;

    private Long userScore = 0L;


    @Override
    public DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId) {

        String value = strategyRepository.queryRuleValue(strategyId, ruleModel());

        log.info("责任链校验-权重抽奖检查 userId:{} strategyId:{}", userId, strategyId);

        //处理权重抽奖范围值
        Map<Long,String> map = analyticalRuleValue(value);

        List<Long> scoreList = new ArrayList<>(map.keySet());
        //排序积分列表
        Collections.sort(scoreList);

        //分析用户积分区间 返回对应值
        Long scoreIndex = analyticalUserScore(scoreList);

        //积分区间不为空 执行权重抽奖
        if (scoreIndex != null){
            log.info("责任链校验-权重抽奖接管 userId:{} strategyId:{} userScore:{} scoreIndex:{}", userId, strategyId, userScore, scoreIndex);
            Integer awardId = raffleDispatch.getRandomAwardId(strategyId, map.get(scoreIndex));
            return DefaultChainFactory.StrategyAwardVO.builder()
                    .awardId(awardId)
                    .ruleModel(ruleModel())
                    .build();
        }
        log.info("责任链校验-权重抽奖放行 userId:{} strategyId:{}", userId, strategyId);
        return next().logic(userId,strategyId);
    }

    private Long analyticalUserScore(List<Long> scoreList) {

        // 如果用户积分小于最小值，返回 null
        if (userScore < scoreList.get(0)) {
            return null;
        }

        // 遍历区间
        for (int i = 0; i < scoreList.size() - 1; i++) {
            if (userScore >= scoreList.get(i) && userScore < scoreList.get(i + 1)) {
                return scoreList.get(i);
            }
        }

        // 如果用户积分大于等于最大值，返回最大区间值
        return scoreList.get(scoreList.size() - 1);
    }

    private Map<Long, String> analyticalRuleValue(String value) {
        Map<Long, String> map = new HashMap<>();

        String[] split1 = value.split(Commons.SPACE);
        for (String str1 : split1) {
            String[] split2 = str1.split(Commons.COLON);
            if (split2.length != 2){
                throw new RuntimeException("权重抽奖配置错误");
            }
            map.put(Long.parseLong(split2[0]),str1);
        }
        return map;
    }

    @Override
    protected String ruleModel() {
        return DefaultChainFactory.LogicModel.RULE_WEIGHT.getCode();
    }
}
