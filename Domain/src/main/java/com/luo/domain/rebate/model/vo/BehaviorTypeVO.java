package com.luo.domain.rebate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum BehaviorTypeVO {


    SIGN("sign","签到"),
    OPEN_PAY("open_pay","外部支付完成"),;

    private final String code;

    private final String info;

}
