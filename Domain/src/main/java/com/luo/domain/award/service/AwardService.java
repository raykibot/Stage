package com.luo.domain.award.service;

import com.luo.domain.award.event.SendAwardMessageEvent;
import com.luo.domain.award.model.aggregate.UserAwardRecordAggregate;
import com.luo.domain.award.model.entity.TaskEntity;
import com.luo.domain.award.model.entity.UserAwardRecordEntity;
import com.luo.domain.award.model.vo.TaskStateVO;
import com.luo.domain.award.repository.IAwardRepository;
import com.luo.type.event.BaseEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AwardService implements IAwardService{


    @Autowired
    private SendAwardMessageEvent sendAwardMessageEvent;

    @Autowired
    private IAwardRepository awardRepository;


    @Override
    public void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity) {


        //构建消息对象
        SendAwardMessageEvent.SendAwardMessage sendAwardMessage = new SendAwardMessageEvent.SendAwardMessage();
        sendAwardMessage.setUserId(userAwardRecordEntity.getUserId());
        sendAwardMessage.setAwardId(userAwardRecordEntity.getAwardId());
        sendAwardMessage.setAwardTitle(userAwardRecordEntity.getAwardTitle());

        BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> build = sendAwardMessageEvent.build(sendAwardMessage);

        //构建任务对象
        TaskEntity taskEntity = new TaskEntity();
        taskEntity.setUserId(userAwardRecordEntity.getUserId());
        taskEntity.setTopic(sendAwardMessageEvent.topic());
        taskEntity.setMessageId(build.getId());
        taskEntity.setState(TaskStateVO.create);
        taskEntity.setMessage(build);

        //创建聚合对象
        UserAwardRecordAggregate userAwardRecordAggregate = new UserAwardRecordAggregate();
        userAwardRecordAggregate.setTaskEntity(taskEntity);
        userAwardRecordAggregate.setUserAwardRecordEntity(userAwardRecordEntity);

        //事务存储聚合对象
        awardRepository.saveUserAwardRecordAggregate(userAwardRecordAggregate);
    }



}
