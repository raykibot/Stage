package com.luo.domain.activity.service.quota.rule;

public interface IActionChainArmory {

    IActionChain next();

    IActionChain append(IActionChain actionChain);

}
