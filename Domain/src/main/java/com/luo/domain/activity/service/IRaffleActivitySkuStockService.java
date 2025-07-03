package com.luo.domain.activity.service;

import com.luo.domain.activity.model.vo.ActivitySkuStockVO;


/**
 * 抽奖sku库存服务
 *
 * 清空队列 数据库数据  获取队列数据
 */
public interface IRaffleActivitySkuStockService {


    /**
     * 缓存sku消耗完 清空数据库sku
     * @param sku sku
     */
    void clearActivitySkuStock(Integer sku);


    /**
     * 清空队列
     */
    void clearQueueValue();


    /**
     * 延迟队列更新数据库库存
     * @param sku sku
     */
    void updateActivitySkuStock(Integer sku);


    /**
     * 获取延迟队列数据
     * @return 扣减对象
     */
    ActivitySkuStockVO takeQueueValue();



}
