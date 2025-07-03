package com.luo.trigger.listener;


import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import com.luo.domain.activity.service.IRaffleActivitySkuStockService;
import com.luo.type.event.BaseEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ActivitySkuStockZeroConsumer {


    @Value("${spring.rabbitmq.topic.activity_sku_stock_zero}")
    private String topic;


    @Autowired
    private IRaffleActivitySkuStockService raffleActivitySkuStockService;


    @RabbitListener(queuesToDeclare = @Queue(value = "activity_sku_stock_zero"))
    public void listener(String message){

        try {
            log.info("库存扣减为0  MQ消息监听处理");

            Integer sku = JSON.parseObject(message, new TypeReference<BaseEvent.EventMessage<Integer>>() {
            }.getType());

            log.info("清空队列数据");
            raffleActivitySkuStockService.clearQueueValue();

            log.info("清空数据库库存");
            raffleActivitySkuStockService.clearActivitySkuStock(sku);
        } catch (Exception e) {
            log.error("库存扣减为0  MQ消息监听处理失败", e);
            throw e;
        }
    }



}
