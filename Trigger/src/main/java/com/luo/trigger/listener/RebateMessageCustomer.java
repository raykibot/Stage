package com.luo.trigger.listener;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import com.luo.domain.activity.model.entity.SkuRechargeEntity;
import com.luo.domain.activity.service.IRaffleActivityAccountQuotaService;
import com.luo.domain.rebate.event.SendRebateMessageEvent;
import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import com.luo.domain.rebate.model.vo.RebateTypeVO;
import com.luo.type.event.BaseEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class RebateMessageCustomer {


    @Autowired
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;

    @Value("${spring.rabbitmq.topic.send_rebate}")
    private String topic;


    @RabbitListener(queuesToDeclare = @Queue(value = "${spring.rabbitmq.topic.send_rebate}"))
    public void listener(String message) {

        try {
            //1. 转换消息
            BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> eventMessage = JSON.parseObject(message, new TypeReference<BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage>>() {
            }.getType());
            SendRebateMessageEvent.RebateMessage rebateMessage = eventMessage.getData();
            if (!rebateMessage.getRebateType().equals(RebateTypeVO.SKU.getCode())) {
                log.info("暂且不处理非sku奖励 topic: {} message: {}\", topic, message", topic, message);
                return;
            }
            //2.入账奖励
            SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
            skuRechargeEntity.setUserId(rebateMessage.getUserId());
            skuRechargeEntity.setSku(Integer.valueOf(rebateMessage.getRebateConfig()));
            skuRechargeEntity.setOutBusinessOutNo(rebateMessage.getBizId());
            log.info("mq消费 增加用户账户次数");
            raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
        } catch (Exception e) {
            log.error("消费失败，忽略本次消息，防止死循环。message: {}，error: {}", message, e.getMessage(), e);
        }
    }

}
