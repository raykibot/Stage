package com.luo.domain.activity.service.armory;

import java.util.Date;

public interface IActivityDispatch {


    /**
     * 扣减缓存库存数据
     * @param sku sku
     * @param endDateTime 活动结束时间 根据结束时间设置加锁的key为结束时间
     * @return 操作结果
     */
    Boolean subtractStock(Integer sku, Date endDateTime);




}
