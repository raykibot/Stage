package com.luo.infrastructure.event;

import com.alibaba.fastjson2.JSON;
import com.luo.type.event.BaseEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class EventPublisher {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void publish(String topic, BaseEvent.EventMessage<?> baseEventMessage){
        try {
            String message = JSON.toJSONString(baseEventMessage);
            rabbitTemplate.convertAndSend(topic, message);
            log.info("发送MQ消息 topic:{}, message:{}",topic, baseEventMessage);
        } catch (AmqpException e) {
            log.error("发送MQ消息失败 topic:{}, message:{}",topic, baseEventMessage);
            throw new RuntimeException(e);
        }
    }


    public void publish(String topic, String eventJSONMessage){
        try {
            rabbitTemplate.convertAndSend(topic, eventJSONMessage);
            log.info("发送MQ消息 topic:{}, message:{}",topic, eventJSONMessage);
        } catch (AmqpException e) {
            log.error("发送MQ消息失败 topic:{}, message:{}",topic, eventJSONMessage);
            throw new RuntimeException(e);
        }
    }

}
