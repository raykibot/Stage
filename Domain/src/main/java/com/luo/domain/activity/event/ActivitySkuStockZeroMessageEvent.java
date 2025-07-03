package com.luo.domain.activity.event;

import com.luo.type.event.BaseEvent;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class ActivitySkuStockZeroMessageEvent extends BaseEvent<Integer>{


    @Value("${spring.rabbitmq.topic.activity_sku_stock_zero}}")
    private String topic;


    @Override
    public EventMessage<Integer> build(Integer data) {
        return EventMessage.<Integer>builder()
                .id(RandomStringUtils.randomNumeric(12))
                .timestamp(new Date())
                .data(data)
                .build();
    }

    @Override
    public String topic() {
        return topic;
    }
}
