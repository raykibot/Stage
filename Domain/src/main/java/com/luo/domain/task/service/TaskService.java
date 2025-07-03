package com.luo.domain.task.service;

import com.luo.domain.task.model.entity.TaskEntity;
import com.luo.domain.task.repository.ITaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService implements ITAskService{


    @Autowired
    private ITaskRepository taskRepository;


    @Override
    public List<TaskEntity> queryUnSendMessageTaskList() {
        return taskRepository.queryUnSendMessageTaskList();
    }

    @Override
    public void sendMessage(TaskEntity taskEntity) {
        taskRepository.sendMessage(taskEntity);
    }

    @Override
    public void updateTaskCompleted(String userId, String messageId) {
        taskRepository.updateTaskCompleted(userId, messageId);
    }
}
