package com.luo.domain.activity.model.vo;

import lombok.*;

@Getter
@AllArgsConstructor
public enum RaffleOrderStateVO {


    completed("completed", "完成");

    private final String code;

    private final String desc;
}
