package com.luo.domain.activity.service.quota.rule.factory;

import com.luo.domain.activity.service.quota.rule.IActionChain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class DefaultActionChainFactory {

    private final IActionChain actionChain;

    public DefaultActionChainFactory(Map<String, IActionChain> actionChainMapGroups) {
        actionChain = actionChainMapGroups.get(ActionModel.action_activity_base.getCode());
        actionChain.append(actionChainMapGroups.get(ActionModel.action_activity_sku.getCode()));
    }


    public IActionChain openActionChain() {
        return this.actionChain;
    }

    @AllArgsConstructor
    @Getter
    public enum ActionModel {

        action_activity_base("action_activity_base", "活动库存、时间校验"),
        action_activity_sku("action_activity_sku", "活动sku库存扣减"),;

        private final String code;

        private final String desc;

    }


}



