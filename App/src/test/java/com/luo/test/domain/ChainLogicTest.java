package com.luo.test.domain;

import com.luo.domain.strategy.service.armory.IAssembleArmory;
import com.luo.domain.strategy.service.rule.chain.ILogicChain;
import com.luo.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.luo.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.util.ReflectionTestUtils;

@SpringBootTest
@Slf4j
public class ChainLogicTest {


    @Autowired
    private IAssembleArmory assembleArmory;

    @Autowired
    private RuleWeightLogicChain ruleWeightLogicChain;

    @Autowired
    private DefaultChainFactory defaultChainFactory;



    @Test
    public void assembleTest() {
         log.info("装配结果:{}",assembleArmory.assembleRaffleStrategy(100001L));
         //log.info("装配结果:{}",assembleArmory.assembleRaffleStrategy(100002L));
    }


    @Test
    public void chainTest(){

        ReflectionTestUtils.setField(ruleWeightLogicChain,"userScore",400L);

        ILogicChain iLogicChain = defaultChainFactory.openChain(100001L);

        for (int i = 0; i < 3; i++) {
            DefaultChainFactory.StrategyAwardVO awardVO = iLogicChain.logic("user", 100001L);
            log.info("返回奖品id:{}",awardVO.getAwardId());
        }
    }


}
