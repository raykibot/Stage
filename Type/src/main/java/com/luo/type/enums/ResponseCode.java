package com.luo.type.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum ResponseCode {

    SUCCESS("0000","调用成功"),
    FAIL("1111","调用失败");

    private String code;

    private String info;

}
