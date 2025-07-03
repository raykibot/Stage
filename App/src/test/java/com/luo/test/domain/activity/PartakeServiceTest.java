package com.luo.test.domain.activity;

import com.alibaba.fastjson2.JSON;
import com.luo.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.luo.domain.activity.model.entity.UserRaffleOrderEntity;
import com.luo.domain.activity.service.IRaffleActivityPartakeService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
@Slf4j
public class PartakeServiceTest {



    @Autowired
    private IRaffleActivityPartakeService raffleActivityPartakeService;


    @Test
    public void partake_test(){

        PartakeRaffleActivityEntity req = new PartakeRaffleActivityEntity();
        req.setUserId("luojiakeng");
        req.setActivityId(100301L);
        UserRaffleOrderEntity order = raffleActivityPartakeService.createOrder(req);

        log.info("扣减返回订单：{}", JSON.toJSONString(order));
    }



}
