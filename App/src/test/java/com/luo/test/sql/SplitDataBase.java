package com.luo.test.sql;

import com.luo.domain.activity.model.entity.SkuRechargeEntity;
import com.luo.domain.activity.service.IRaffleActivityAccountQuotaService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SplitDataBase {

    @Autowired
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;


    @Test
    public void sql_test() {

        SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
        skuRechargeEntity.setUserId("luojiakeng");
        skuRechargeEntity.setSku(9011);
        String orderId = raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
        log.info("订单编号：{}", orderId);
    }

}
