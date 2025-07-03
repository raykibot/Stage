package com.luo.infrastructure.repository;

import com.alibaba.fastjson2.JSON;
import com.luo.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import com.luo.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import com.luo.domain.rebate.model.entity.TaskEntity;
import com.luo.domain.rebate.model.vo.BehaviorTypeVO;
import com.luo.domain.rebate.model.vo.DailyBehaviorRebateVO;
import com.luo.domain.rebate.repository.IBehaviorRebateRepository;
import com.luo.infrastructure.dao.IDailyBehaviorRebateDAO;
import com.luo.infrastructure.dao.ITaskDAO;
import com.luo.infrastructure.dao.IUserBehaviorRebateDAO;
import com.luo.infrastructure.event.EventPublisher;
import com.luo.infrastructure.pojo.BehaviorRebateOrder;
import com.luo.infrastructure.pojo.DailyBehaviorRebate;
import com.luo.infrastructure.pojo.Task;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class BehaviorRebateRepository implements IBehaviorRebateRepository {


    @Autowired
    private IDailyBehaviorRebateDAO dailyBehaviorRebateDAO;

    @Autowired
    private IUserBehaviorRebateDAO userBehaviorRebateDAO;

    @Autowired
    private ITaskDAO taskDAO;

    @Autowired
    private EventPublisher publisher;


    @Override
    public List<DailyBehaviorRebateVO> queryDailyRebateConfig(BehaviorTypeVO behaviorType) {
        List<DailyBehaviorRebate> list = dailyBehaviorRebateDAO.queryDailyRebateConfig(behaviorType.getCode());
        List<DailyBehaviorRebateVO> voList = new ArrayList<>(list.size());
        for (DailyBehaviorRebate dailyBehaviorRebate : list) {
            DailyBehaviorRebateVO vo = DailyBehaviorRebateVO.builder()
                    .behaviorType(dailyBehaviorRebate.getBehaviorType())
                    .rebateDesc(dailyBehaviorRebate.getRebateDesc())
                    .rebateType(dailyBehaviorRebate.getRebateType())
                    .rebateConfig(dailyBehaviorRebate.getRebateConfig())
                    .state(dailyBehaviorRebate.getState())
                    .build();
            voList.add(vo);
        }
        return voList;
    }

    @Transactional
    @Override
    public void saveBehaviorRebateAggregate(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates) {


        try {
            for (BehaviorRebateAggregate behaviorRebateAggregate : behaviorRebateAggregates) {
                BehaviorRebateOrderEntity behaviorRebateOrderEntity = behaviorRebateAggregate.getBehaviorRebateOrderEntity();
                // 用户行为返利订单对象
                BehaviorRebateOrder behaviorRebateOrder = BehaviorRebateOrder.builder()
                        .userId(behaviorRebateOrderEntity.getUserId())
                        .orderId(behaviorRebateOrderEntity.getOrderId())
                        .behaviorType(behaviorRebateOrderEntity.getBehaviorType())
                        .rebateDesc(behaviorRebateOrderEntity.getRebateDesc())
                        .rebateType(behaviorRebateOrderEntity.getRebateType())
                        .rebateConfig(behaviorRebateOrderEntity.getRebateConfig())
                        .bizId(behaviorRebateOrderEntity.getBizId())
                        .build();

                userBehaviorRebateDAO.insert(behaviorRebateOrder);

                //任务对象
                TaskEntity taskEntity = behaviorRebateAggregate.getTaskEntity();
                Task task = Task.builder()
                        .userId(taskEntity.getUserId())
                        .topic(taskEntity.getTopic())
                        .message(JSON.toJSONString(taskEntity.getMessage()))
                        .state(taskEntity.getTaskState().getCode())
                        .messageId(taskEntity.getMessageId())
                        .build();
                taskDAO.insert(task);
            }
        } catch (Exception e) {
            log.info("rebate模块 repository位置错误");
            throw new RuntimeException(e);
        }

        // 同步发送MQ消息
        for (BehaviorRebateAggregate behaviorRebateAggregate : behaviorRebateAggregates) {
            TaskEntity taskEntity = behaviorRebateAggregate.getTaskEntity();
            Task task = new Task();
            task.setUserId(taskEntity.getUserId());
            task.setMessageId(taskEntity.getMessageId());
            try {
                // 发送消息【在事务外执行，如果失败还有任务补偿】
                publisher.publish(taskEntity.getTopic(), taskEntity.getMessage());
                // 更新数据库记录，task 任务表
                taskDAO.updateTaskSendMessageCompleted(task);
            } catch (Exception e) {
                log.error("写入返利记录，发送MQ消息失败 userId: {} topic: {}", userId, task.getTopic());
                throw new RuntimeException(e);
            }
        }


    }
}
