package com.luo.test;

import com.luo.domain.strategy.service.armory.IAssembleArmory;
import com.luo.infrastructure.redis.IRedisService;
import com.luo.type.constants.Commons;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Random;

@SpringBootTest
@Slf4j
public class ApiTests {

    @Autowired
    private IAssembleArmory assembleArmory;

    @Autowired
    private IRedisService redisService;

    @Test
    public void assembleTest(){
        log.info("装配：{}",assembleArmory.assembleRaffleStrategy(100006L));
    }

    @Test
    public void raffleTest(){
        Integer value = redisService.getValue(Commons.RedisKey.STRATEGY_AWARD_RATE_RANGE_KEY + 100001L + Commons.UNDERLINE + 10001);
        System.out.println(value);

        List<Integer> value1 = redisService.getValue(Commons.RedisKey.STRATEGY_AWARD_RATE_TABLE_KEY + 100001L);
        log.info("奖品概率查找表：{}",value1.size());
        Integer awardId = value1.get( new Random().nextInt(value));
        System.out.println(awardId);
    }

}
