package com.luo.test.domain;

import com.luo.domain.strategy.service.armory.IAssembleArmory;
import com.luo.domain.strategy.service.armory.IRaffleDispatch;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class getAwardRandom {


    @Autowired
    private IAssembleArmory assembleArmory;

    @Autowired
    private IRaffleDispatch dispatcher;


    @Test
    public void assembleTest(){
        Boolean status = assembleArmory.assembleRaffleStrategy(100001L);
        log.info("装配结果:{}",status);
    }


    @Test
    public void getAwardRandom(){
        Integer randomAwardId = dispatcher.getRandomAwardId(100001L);
        log.info("全量抽奖奖品id：{}",randomAwardId);
    }


    @Test
    public void getAwardRandomByRuleWeight(){
        Integer randomAwardId_1000 = dispatcher.getRandomAwardId(100001L,"1000:102,103,104,105,106");
        log.info("规则权重抽奖奖品id_1000：{}",randomAwardId_1000);

        Integer randomAwardId_2000 = dispatcher.getRandomAwardId(100001L,"2000:102,103,104,105,106,107");
        log.info("规则权重抽奖奖品id_2000：{}",randomAwardId_2000);

        Integer randomAwardId_3000 = dispatcher.getRandomAwardId(100001L,"3000:102,103,104,105,106,107,108,109");
        log.info("规则权重抽奖奖品id_3000：{}",randomAwardId_3000);
    }




}
