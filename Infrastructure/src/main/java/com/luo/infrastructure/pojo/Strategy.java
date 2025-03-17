package com.luo.infrastructure.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Strategy {


    private Long strategyId;

    private String strategyDesc;

    private String ruleModels;

    private Date createTime;

    private Date updateTime;

}
