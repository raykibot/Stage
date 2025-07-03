package com.luo.domain.award.model.entity;


import com.luo.domain.award.event.SendAwardMessageEvent;
import com.luo.domain.award.model.vo.TaskStateVO;
import com.luo.type.event.BaseEvent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TaskEntity {


    private String userId;

    private String topic;

    private BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> message;

    private TaskStateVO state;

    private String messageId;

    private Date createTime;

    private Date updateTime;

}
