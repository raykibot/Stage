package com.luo.domain.task.service;

import com.luo.domain.task.model.entity.TaskEntity;

import java.util.List;

public interface ITAskService {




    List<TaskEntity> queryUnSendMessageTaskList();

    void sendMessage(TaskEntity taskEntity);

    void updateTaskCompleted(String userId, String messageId);


}
