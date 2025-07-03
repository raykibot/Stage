package com.luo.trigger.job;

import com.luo.domain.strategy.model.vo.StrategyAwardStockVO;

import com.luo.domain.strategy.service.IRaffleStock;
import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
@Slf4j
public class UpdateAwardStockJob {


    @Resource
    private IRaffleStock raffleStock;

    //@Scheduled(cron = "0/5 * * * * ?")
    public void updateAwardStock() {
        try {
            log.info("定时任务 从延迟队列中获取奖品数据");
            StrategyAwardStockVO queueValue = raffleStock.takeQueueValue();
            if (queueValue == null){
                log.info("定时任务 延迟队列中没有数据");
                return;
            }
            log.info("定时任务 开始更新奖品库存");
            raffleStock.updateStrategyAwardStock(queueValue.getStrategyId(), queueValue.getAwardId());
        } catch (Exception e) {
            throw new RuntimeException("定时任务 更新奖品库存失败",e);
        }
    }

}
