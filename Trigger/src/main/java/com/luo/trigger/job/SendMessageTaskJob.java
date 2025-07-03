package com.luo.trigger.job;


import com.luo.domain.task.model.entity.TaskEntity;
import com.luo.domain.task.service.ITAskService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class SendMessageTaskJob {


    @Autowired
    private ITAskService taskService;



    @Scheduled(cron = "0/5 * * * * ?")
    public void execute() {

        try {
            log.info("开始执行task定时任务");
            List<TaskEntity> taskEntities = taskService.queryUnSendMessageTaskList();
            if (taskEntities.isEmpty()) return;
            log.info("task执行mq更新");
            for (TaskEntity taskEntity : taskEntities) {
                taskService.sendMessage(taskEntity);
                taskService.updateTaskCompleted(taskEntity.getUserId(), taskEntity.getMessageId());
            }
        } catch (Exception e) {
            throw new RuntimeException("任务定时mq更新失败");
        }

    }



}
