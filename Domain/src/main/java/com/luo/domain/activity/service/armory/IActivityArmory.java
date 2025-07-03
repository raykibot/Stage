package com.luo.domain.activity.service.armory;

public interface IActivityArmory {

    /**
     * 根据活动ID装配活动SKU
     * @param activityId 活动id
     */
    boolean assembleActivitySkuByActivityId(Long activityId);

}
