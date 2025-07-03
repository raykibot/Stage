package com.luo.domain.activity.model.aggregate;

import com.luo.domain.activity.model.entity.RaffleActivityOrderEntity;
import com.luo.domain.activity.model.vo.RaffleOrderStateVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreatQuotaOrderAggregate {

    private String userId;

    private Long activityId;

    private Integer totalCount;

    private Integer dayCount;

    private Integer monthCount;

    private RaffleActivityOrderEntity raffleActivityOrderEntity;

}
