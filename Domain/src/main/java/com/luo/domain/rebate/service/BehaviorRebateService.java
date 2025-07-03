package com.luo.domain.rebate.service;

import com.luo.domain.award.model.vo.TaskStateVO;
import com.luo.domain.rebate.event.SendRebateMessageEvent;
import com.luo.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import com.luo.domain.rebate.model.entity.BehaviorEntity;
import com.luo.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import com.luo.domain.rebate.model.entity.TaskEntity;
import com.luo.domain.rebate.model.vo.DailyBehaviorRebateVO;
import com.luo.domain.rebate.repository.IBehaviorRebateRepository;
import com.luo.type.constants.Commons;
import com.luo.type.event.BaseEvent;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BehaviorRebateService implements IBehaviorRebateService{

    @Autowired
    private IBehaviorRebateRepository behaviorRebateRepository;

    @Autowired
    private SendRebateMessageEvent sendRebateMessageEvent;

    @Override
    public List<String> createOrderIds(BehaviorEntity behaviorEntity) {

        //1. 查询返利配置
        List<DailyBehaviorRebateVO> list = behaviorRebateRepository.queryDailyRebateConfig(behaviorEntity.getBehaviorType());
        if (list == null || list.isEmpty()) return new ArrayList<>();

        //2. 构建聚合对象
        List<String> orderIds = new ArrayList<>();
        List<BehaviorRebateAggregate> behaviorRebateAggregates = new ArrayList<>();

        for (DailyBehaviorRebateVO dailyBehaviorRebateVO : list) {
            // 拼装业务ID；用户ID_返利类型_外部透彻业务ID
            String bizId = behaviorEntity.getUserId()+ Commons.UNDERLINE+ dailyBehaviorRebateVO.getRebateType()+Commons.UNDERLINE+behaviorEntity.getOutBusinessNo();
            BehaviorRebateOrderEntity rebateOrderEntity = BehaviorRebateOrderEntity.builder()
                    .userId(behaviorEntity.getUserId())
                    .orderId(RandomStringUtils.randomNumeric(12))
                    .behaviorType(dailyBehaviorRebateVO.getBehaviorType())
                    .rebateDesc(dailyBehaviorRebateVO.getRebateDesc())
                    .rebateType(dailyBehaviorRebateVO.getRebateType())
                    .rebateConfig(dailyBehaviorRebateVO.getRebateConfig())
                    .bizId(bizId)
                    .build();

            orderIds.add(rebateOrderEntity.getOrderId());

            //MQ 消息对象
            SendRebateMessageEvent.RebateMessage rebateMessage = SendRebateMessageEvent.RebateMessage.builder()
                    .userId(behaviorEntity.getUserId())
                    .rebateType(dailyBehaviorRebateVO.getRebateType())
                    .rebateConfig(dailyBehaviorRebateVO.getRebateConfig())
                    .bizId(bizId)
                    .build();

            //构建事件消息
            BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> message = sendRebateMessageEvent.build(rebateMessage);

            //组装任务对象
            TaskEntity taskEntity = TaskEntity.builder()
                    .userId(behaviorEntity.getUserId())
                    .topic(sendRebateMessageEvent.topic())
                    .messageId(message.getId())
                    .message(message)
                    .taskState(TaskStateVO.create)
                    .build();

            BehaviorRebateAggregate aggregate = BehaviorRebateAggregate.builder()
                    .userId(behaviorEntity.getUserId())
                    .behaviorRebateOrderEntity(rebateOrderEntity)
                    .taskEntity(taskEntity)
                    .build();

            behaviorRebateAggregates.add(aggregate);
        }

        //3, 存储聚合对象
        behaviorRebateRepository.saveBehaviorRebateAggregate(behaviorEntity.getUserId(), behaviorRebateAggregates);

        //4. 返回订单ID集合
        return orderIds;
    }
}
