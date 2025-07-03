package com.luo.infrastructure.repository;

import com.luo.domain.task.model.entity.TaskEntity;
import com.luo.domain.task.repository.ITaskRepository;
import com.luo.infrastructure.dao.ITaskDAO;
import com.luo.infrastructure.event.EventPublisher;
import com.luo.infrastructure.pojo.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TaskRepository implements ITaskRepository {

    @Autowired
    private ITaskDAO taskDAO;

    @Autowired
    private EventPublisher publisher;

    @Override
    public List<TaskEntity> queryUnSendMessageTaskList() {
        List<Task> list = taskDAO.queryUnSendMessageTaskList();
        List<TaskEntity> taskEntityList = new ArrayList<>();
        for (Task task : list) {
            TaskEntity taskEntity = TaskEntity.builder()
                    .userId(task.getUserId())
                    .topic(task.getTopic())
                    .message(task.getMessage())
                    .messageId(task.getMessageId())
                    .state(task.getState())
                    .build();
            taskEntityList.add(taskEntity);
        }
        return taskEntityList;
    }

    @Override
    public void sendMessage(TaskEntity taskEntity) {
        publisher.publish(taskEntity.getTopic(), taskEntity.getMessage());
    }


    @Override
    public void updateTaskCompleted(String userId, String messageId) {
        Task task = new Task();
        task.setMessageId(messageId);
        task.setUserId(userId);
        taskDAO.updateTaskSendMessageCompleted(task);
    }
}
