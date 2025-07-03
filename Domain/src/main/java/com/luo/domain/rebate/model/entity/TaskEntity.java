package com.luo.domain.rebate.model.entity;


import com.luo.domain.award.model.vo.TaskStateVO;
import com.luo.domain.rebate.event.SendRebateMessageEvent;
import com.luo.type.event.BaseEvent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskEntity {


    /** 活动ID */
    private String userId;
    /** 消息主题 */
    private String topic;
    /** 消息编号 */
    private String messageId;
    /** 消息主体 */
    private BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> message;
    /** 任务状态 */
    private TaskStateVO taskState;

}
