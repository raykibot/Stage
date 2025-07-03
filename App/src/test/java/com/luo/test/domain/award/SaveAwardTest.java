package com.luo.test.domain.award;

import com.luo.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.luo.domain.activity.model.entity.UserRaffleOrderEntity;
import com.luo.domain.activity.service.IRaffleActivityPartakeService;
import com.luo.domain.award.model.entity.UserAwardRecordEntity;
import com.luo.domain.award.model.vo.AwardStateVO;
import com.luo.domain.award.service.IAwardService;
import com.luo.domain.strategy.model.entity.RaffleAwardEntity;
import com.luo.domain.strategy.model.entity.RaffleFactorEntity;
import com.luo.domain.strategy.service.armory.IAssembleArmory;
import com.luo.domain.strategy.service.IRaffleStrategy;
import lombok.extern.slf4j.Slf4j;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@SpringBootTest
@Slf4j
@RunWith(SpringRunner.class)
public class SaveAwardTest {


    @Autowired
    private IAssembleArmory assembleArmory;

    @Autowired
    private IAwardService awardService;

    @Autowired
    private IRaffleActivityPartakeService raffleActivityPartakeService;

    @Autowired
    private IRaffleStrategy raffleStrategy;


    @Test
    public void prepare_test(){

        assembleArmory.assembleRaffleStrategy(100006L);

        PartakeRaffleActivityEntity req = new PartakeRaffleActivityEntity();
        req.setUserId("luojiakeng");
        req.setActivityId(100301L);
        UserRaffleOrderEntity order = raffleActivityPartakeService.createOrder(req);


        RaffleFactorEntity raffleFactorEntity = new RaffleFactorEntity();
        raffleFactorEntity.setUserId(order.getUserId());
        raffleFactorEntity.setStrategyId(order.getStrategyId());
        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);


        UserAwardRecordEntity userAwardRecord = new UserAwardRecordEntity();
        userAwardRecord.setAwardId(raffleAwardEntity.getAwardId());
        userAwardRecord.setUserId(order.getUserId());
        userAwardRecord.setAwardState(AwardStateVO.create);
        userAwardRecord.setOrderId(order.getOrderId());
        userAwardRecord.setOrderTime(new Date());
        userAwardRecord.setStrategyId(order.getStrategyId());
        userAwardRecord.setAwardTitle(raffleAwardEntity.getAwardConfig());
        userAwardRecord.setAwardTitle(raffleAwardEntity.getAwardTitle());
        userAwardRecord.setActivityId(order.getActivityId());

        awardService.saveUserAwardRecord(userAwardRecord);
    }


}
