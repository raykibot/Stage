package com.luo.domain.activity.model.entity;

import com.luo.domain.activity.model.vo.UserRaffleStateVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRaffleOrderEntity {

    private String userId;

    private Long activityId;

    private Long strategyId;

    private String activityName;

    private String orderId;

    private Date orderTime;

    private UserRaffleStateVO orderState;

}
