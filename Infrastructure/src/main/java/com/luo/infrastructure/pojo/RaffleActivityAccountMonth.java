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
public class RaffleActivityAccountMonth {

    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");

    private String userId;

    private Long activityId;

    private String month;

    private Integer monthCount;

    private Integer monthCountSurplus;

    private Date createTime;

    private Date updateTime;

    public String currentTime() {
        return dateFormat.format(new Date());
    }
}
