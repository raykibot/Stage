package com.luo.domain.activity.model.entity;

import com.luo.domain.activity.model.vo.ActivityStateVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivityEntity {


    private Long activityId;

    private String activityName;

    private String activityDesc;

    private Date beginDateTime;

    private Date endDateTime;

    private Long strategyId;

    private ActivityStateVO state;

}
