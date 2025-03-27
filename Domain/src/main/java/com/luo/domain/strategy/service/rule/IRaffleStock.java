package com.luo.domain.strategy.service.rule;

import com.luo.domain.strategy.model.vo.StrategyAwardStockVO;

/**
 * 库存扣减服务
 */
public interface IRaffleStock {


    /**
     * 获取队列奖品信息
     * @return strategyId awardId
     */
    StrategyAwardStockVO takeQueueValue();


    /**
     * 更新库存消耗记录
     * @param strategyId
     * @param awardId
     */
    void updateStrategyAwardStock(Long strategyId, Integer awardId);
}
