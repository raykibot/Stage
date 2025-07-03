package com.luo.test.domain.activity;

import com.luo.domain.activity.model.entity.SkuRechargeEntity;
import com.luo.domain.activity.service.IRaffleActivityAccountQuotaService;
import com.luo.domain.activity.service.armory.IActivityArmory;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class ActivityRechargeTest {


    @Autowired
    private IActivityArmory activityArmory;

    @Autowired
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;



    @Test
    public void activity_armory_test(){
        boolean status = activityArmory.assembleActivitySkuByActivityId(100301L);
        log.info("活动装配:{}",status);
    }

    @Test
    public void activity_recharge_test(){

        SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
        skuRechargeEntity.setSku(9011);
        skuRechargeEntity.setUserId("test2");
        skuRechargeEntity.setOutBusinessOutNo(RandomStringUtils.randomNumeric(12));
        String order = raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
        log.info("用户订单:{}",order);

    }

    @Test
    public void activity_recharge_test2(){
        for (int i = 0; i < 10; i++) {
            SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
            skuRechargeEntity.setSku(9022);
            skuRechargeEntity.setUserId("test3");
            skuRechargeEntity.setOutBusinessOutNo(RandomStringUtils.randomNumeric(12));
            String order = raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
            log.info("用户订单:{}",order);
        }
    }

    @Test
    public void activity_recharge_test3(){
            SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
            skuRechargeEntity.setSku(9022);
            skuRechargeEntity.setUserId("test4");
            skuRechargeEntity.setOutBusinessOutNo(RandomStringUtils.randomNumeric(12));
            String order = raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
            log.info("用户订单:{}",order);
    }





}
