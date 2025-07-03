package com.luo.test.domain.strategy;

import com.alibaba.fastjson2.JSON;
import com.luo.domain.activity.service.armory.IActivityArmory;
import com.luo.domain.strategy.service.armory.IAssembleArmory;
import com.luo.trigger.api.IRaffleActivityService;
import com.luo.trigger.api.dto.ActivityDrawRequestDTO;
import com.luo.trigger.api.dto.ActivityDrawResponseDTO;
import com.luo.type.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class DrawTest {


    @Autowired
    private IRaffleActivityService raffleActivityService;

    @Autowired
    private IAssembleArmory strategyAssemble;


    @Test
    public void test_armory(){
        strategyAssemble.assembleRaffleStrategy(100006L);
    }

    @Test
    public void test_draw(){

        ActivityDrawRequestDTO requestDTO = new ActivityDrawRequestDTO();
        requestDTO.setUserId("luojiakeng");
        requestDTO.setActivityId(100301L);
        Response<ActivityDrawResponseDTO> draw = raffleActivityService.draw(requestDTO);
        log.info("抽奖结果:{}", JSON.toJSONString(draw));
    }

}
