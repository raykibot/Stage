package com.luo.domain.award.event;

import com.luo.type.event.BaseEvent;
import jdk.jfr.Event;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class SendAwardMessageEvent extends BaseEvent<SendAwardMessageEvent.SendAwardMessage> {

    @Value("${spring.rabbitmq.topic.send_award}")
    private String topic;


    @Override
    public EventMessage<SendAwardMessage> build(SendAwardMessage data) {

        return EventMessage.<SendAwardMessage>builder()
                .id(RandomStringUtils.randomNumeric(12))
                .timestamp(new Date())
                .data(data)
                .build();
    }

    @Override
    public String topic() {
        return topic;
    }


    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class SendAwardMessage{

        private String userId;

        private Integer awardId;

        private String awardTitle;
    }
}
