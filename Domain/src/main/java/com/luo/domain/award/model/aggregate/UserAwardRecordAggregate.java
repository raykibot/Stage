package com.luo.domain.award.model.aggregate;

import com.luo.domain.award.model.entity.TaskEntity;
import com.luo.domain.award.model.entity.UserAwardRecordEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UserAwardRecordAggregate {



    private TaskEntity taskEntity;

    private UserAwardRecordEntity userAwardRecordEntity;



}
