package com.luo.domain.rebate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum TaskStateVO {


    create("create", "创建"),
    complete("complete", "发送完成"),
    fail("fail", "发送失败"),;


    private final String code ;

    private final String desc ;

}
