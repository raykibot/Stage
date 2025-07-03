package com.luo.infrastructure.pojo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivityAccountDay {

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    private String userId;

    private Long activityId;

    private String day;

    private Integer dayCount;

    private Integer dayCountSurplus;

    private Date createTime;

    private Date updateTime;

    public String currentTime(){
        return dateFormat.format(new Date());
    }
}
