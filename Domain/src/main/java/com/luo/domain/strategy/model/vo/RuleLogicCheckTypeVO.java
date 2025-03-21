package com.luo.domain.strategy.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum RuleLogicCheckTypeVO {



    ALLOW("0000","放行，执行后续流程 "),
    TAKE_OVER("0001","拦截，不执行后续流程 "),
    ;

    private final String code;

    private final String info;

}
