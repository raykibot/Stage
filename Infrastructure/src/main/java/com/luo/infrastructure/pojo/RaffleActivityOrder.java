package com.luo.infrastructure.pojo;

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
public class RaffleActivityOrder {

    private String userId;

    private Integer sku;

    private Long activityId;

    private String activityName;

    private Long strategyId;

    private String orderId;

    private Date orderTime;

    private Integer totalCount;

    private Integer dayCount;

    private Integer monthCount;

    private String state;

    private String outBusinessNo;

    private Date createTime;

    private Date updateTime;

}
