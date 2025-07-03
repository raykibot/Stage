package com.luo.test.domain.rebate;

import com.luo.domain.rebate.model.entity.BehaviorEntity;
import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import com.luo.domain.rebate.service.IBehaviorRebateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class BehaviorRebateServiceTest {


    @Autowired
    private IBehaviorRebateService behaviorRebateService;


    @Test
    public void test_behavior(){
        BehaviorEntity behaviorEntity = BehaviorEntity.builder()
                .userId("xiaofuge")
                .behaviorType(BehaviorTypeVO.SIGN)
                .outBusinessNo("30243219")
                .build();
        List<String> orderIds = behaviorRebateService.createOrderIds(behaviorEntity);
        log.info("订单集合:{}",orderIds);
    }


}
