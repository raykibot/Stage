package com.luo.trigger.job;

import com.luo.domain.strategy.model.vo.StrategyAwardStockVO;
import com.luo.domain.strategy.repository.IStrategyRepository;
import com.luo.domain.strategy.service.rule.IRaffleStock;
import com.luo.type.constants.Commons;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class RabbitmqListener {

    @Autowired
    private IRaffleStock raffleStock;

    @RabbitListener(queues = Commons.DEAD_LETTER_QUEUE)
    public void handleUpdateAwardStock(StrategyAwardStockVO queueValue) {

        log.info("收到死信队列消息，处理奖品库存更新，awardId={}, strategyId={}",
                queueValue.getAwardId(), queueValue.getStrategyId());

        raffleStock.updateStrategyAwardStock(queueValue.getStrategyId(), queueValue.getAwardId());
    }

}
