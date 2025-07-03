package com.luo.trigger.job;

import com.luo.domain.activity.model.vo.ActivitySkuStockVO;
import com.luo.domain.activity.service.IRaffleActivitySkuStockService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class UpdateActivitySkuStockJob {


    @Autowired
    private IRaffleActivitySkuStockService raffleActivitySkuStockService;


    @Scheduled(cron = "0/5 * * * * ?")
    public void updateActivitySkuStock() {
        log.info("定时任务---开始执行更新活动库存任务");

        try {
            log.info("定时任务---从延迟队列中获取数据");
            ActivitySkuStockVO activitySkuStockVO = raffleActivitySkuStockService.takeQueueValue();
            if (activitySkuStockVO == null) return;
            log.info("定时任务---更新活动库存");
            raffleActivitySkuStockService.updateActivitySkuStock(activitySkuStockVO.getSku());
        } catch (Exception e) {
            throw new RuntimeException("定时任务---延迟更新数据库失败");
        }
    }
}
