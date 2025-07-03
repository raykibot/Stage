package com.luo.domain.activity.model.aggregate;

import com.luo.domain.activity.model.entity.RaffleActivityAccountDayEntity;
import com.luo.domain.activity.model.entity.RaffleActivityAccountEntity;
import com.luo.domain.activity.model.entity.RaffleActivityAccountMonthEntity;
import com.luo.domain.activity.model.entity.UserRaffleOrderEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户参与订单聚合对象
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreatePartakeOrderAggregate {

    private String userId;

    private Long activityId;

    //总账户
    private RaffleActivityAccountEntity raffleActivityAccountEntity;

    //是否存在月账户    注：boolean是基本数据类型，不能为null 只有true 或 false Boolean是包装类，可以为null
    private boolean isMonthAccount = true;

    //月账户
    private RaffleActivityAccountMonthEntity raffleActivityAccountMonthEntity;

    //是否存在日账户
    private boolean isDayAccount = true;

    //日账户
    private RaffleActivityAccountDayEntity raffleActivityAccountDayEntity;

    //订单对象
    private UserRaffleOrderEntity userRaffleOrder;


}
