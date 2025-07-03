package com.luo.domain.activity.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum UserRaffleStateVO {


    create("create","创建"),
    used("used","使用"),
    cancel("cancel","作废"),
    ;


    private final String code;

    private final String desc;
}
