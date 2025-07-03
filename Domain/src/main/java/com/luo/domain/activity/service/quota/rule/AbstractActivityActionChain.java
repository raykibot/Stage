package com.luo.domain.activity.service.quota.rule;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public abstract class AbstractActivityActionChain implements IActionChain{

    private IActionChain next;

    @Override
    public IActionChain append(IActionChain actionChain) {
        this.next = actionChain;
        return next;
    }

    @Override
    public IActionChain next() {
        return next;
    }
}
