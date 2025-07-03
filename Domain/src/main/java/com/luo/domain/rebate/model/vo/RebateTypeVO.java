package com.luo.domain.rebate.model.vo;

import lombok.*;

@Getter
@AllArgsConstructor
public enum RebateTypeVO {

    SKU("sku", "活动库存充值商品"),
    INTEGRAL("integral", "用户活动积分"),;

    private final String code;
    private final String info;


}
