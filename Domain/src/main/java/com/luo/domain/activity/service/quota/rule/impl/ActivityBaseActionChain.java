package com.luo.domain.activity.service.quota.rule.impl;

import com.luo.domain.activity.model.entity.RaffleActivityCountEntity;
import com.luo.domain.activity.model.entity.RaffleActivityEntity;
import com.luo.domain.activity.model.entity.RaffleActivitySkuEntity;
import com.luo.domain.activity.model.vo.ActivityStateVO;
import com.luo.domain.activity.service.quota.rule.AbstractActivityActionChain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Date;


@Component("action_activity_base")
@Slf4j
public class ActivityBaseActionChain extends AbstractActivityActionChain {
    @Override
    public boolean action(RaffleActivityEntity activityEntity, RaffleActivitySkuEntity raffleActivitySkuEntity, RaffleActivityCountEntity raffleActivityCountEntity) {

        log.info("活动责任链---活动基础信息校验");

        //校验活动状态是否开启
        ActivityStateVO state = activityEntity.getState();
        if (!state.equals(ActivityStateVO.open)){
            throw new RuntimeException("活动未开启");
        }

        //判断活动时间
        Date current = new Date();
        log.info(activityEntity.getBeginDateTime() + "---" + activityEntity.getEndDateTime());
        if (current.before(activityEntity.getBeginDateTime()) || current.after(activityEntity.getEndDateTime())){
            throw new RuntimeException("活动时间未开始或已结束");
        }

        //校验sku库存数量
        if (raffleActivitySkuEntity.getStockCountSurplus() <= 0){
            throw new RuntimeException("活动已售罄");
        }
        return next().action(activityEntity, raffleActivitySkuEntity, raffleActivityCountEntity);
    }
}
