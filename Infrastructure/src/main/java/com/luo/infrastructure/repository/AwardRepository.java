package com.luo.infrastructure.repository;

import com.alibaba.fastjson2.JSON;
import com.luo.domain.award.model.aggregate.UserAwardRecordAggregate;
import com.luo.domain.award.model.entity.TaskEntity;
import com.luo.domain.award.model.entity.UserAwardRecordEntity;
import com.luo.domain.award.model.vo.TaskStateVO;
import com.luo.domain.award.repository.IAwardRepository;
import com.luo.infrastructure.dao.ITaskDAO;
import com.luo.infrastructure.dao.IUserAwardRecordDAO;
import com.luo.infrastructure.dao.IUserRaffleOrderDAO;
import com.luo.infrastructure.event.EventPublisher;
import com.luo.infrastructure.pojo.Task;
import com.luo.infrastructure.pojo.UserAwardRecord;
import com.luo.infrastructure.pojo.UserRaffleOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AwardRepository implements IAwardRepository {


    @Autowired
    private ITaskDAO taskDAO;

    @Autowired
    private IUserAwardRecordDAO userAwardRecordDao;

    @Autowired
    private IUserRaffleOrderDAO userRaffleOrderDao;

    @Autowired
    private EventPublisher publisher;

    @Transactional
    @Override
    public void saveUserAwardRecordAggregate(UserAwardRecordAggregate userAwardRecordAggregate) {

        UserAwardRecordEntity userAwardRecordEntity = userAwardRecordAggregate.getUserAwardRecordEntity();
        TaskEntity taskEntity = userAwardRecordAggregate.getTaskEntity();

        Task task = new Task();
        task.setUserId(taskEntity.getUserId());
        task.setTopic(taskEntity.getTopic());
        task.setMessage(JSON.toJSONString(taskEntity.getMessage()));
        task.setState(TaskStateVO.create.getCode());
        task.setMessageId(taskEntity.getMessageId());

        UserAwardRecord userAwardRecord = new UserAwardRecord();
        userAwardRecord.setUserId(userAwardRecordEntity.getUserId());
        userAwardRecord.setActivityId(userAwardRecordEntity.getActivityId());
        userAwardRecord.setStrategyId(userAwardRecordEntity.getStrategyId());
        userAwardRecord.setAwardTitle(userAwardRecordEntity.getAwardTitle());
        userAwardRecord.setAwardId(userAwardRecordEntity.getAwardId());
        userAwardRecord.setOrderId(userAwardRecordEntity.getOrderId());
        userAwardRecord.setOrderTime(userAwardRecordEntity.getOrderTime());
        userAwardRecord.setAwardState(userAwardRecordEntity.getAwardState().getCode());

        UserRaffleOrder userRaffleOrder = new UserRaffleOrder();
        userRaffleOrder.setUserId(userAwardRecordEntity.getUserId());
        userRaffleOrder.setOrderId(userAwardRecord.getOrderId());

        try {
            //写入记录(user_award_record 表)
            userAwardRecordDao.insert(userAwardRecord);

            //写入任务
            taskDAO.insert(task);

            //更新抽奖单
            int count = userRaffleOrderDao.updateUserRaffleOrder(userRaffleOrder);
            if (count != 1){
                throw new RuntimeException("抽奖单已经使用过");
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }

        try {
            //发送MQ消息
            publisher.publish(task.getTopic(), task.getMessage());
            //更新数据库记录 task任务表
            taskDAO.updateTaskSendMessageCompleted(task);
        }
        catch (RuntimeException e){
            //发送MQ消息失败
            taskDAO.updateTaskSendMessageFail(task);
        }
    }
}
