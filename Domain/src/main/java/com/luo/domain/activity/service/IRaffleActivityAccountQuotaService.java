package com.luo.domain.activity.service;


import com.luo.domain.activity.model.entity.SkuRechargeEntity;

/**
 * 用户抽奖活动配额接口
 */
public interface IRaffleActivityAccountQuotaService {


    /**
     * 创建订单 用户创建 sku 账户充值订单，给用户增加抽奖次数

     * 1. 在【打卡、签到、分享、对话、积分兑换】等行为动作下，创建出活动订单，给用户的活动账户【日、月】充值可用的抽奖次数。
     * 2. 对于用户可获得的抽奖次数，比如首次进来就有一次，则是依赖于运营配置的动作，在前端页面上。用户点击后，可以获得一次抽奖次数。
     *
     * @param skuRechargeEntity 充值实体类信息
     * @return 订单号
     */
    String createOrder(SkuRechargeEntity skuRechargeEntity);


    /**
     *
     * @param activityId 活动id
     * @param userId 用户id
     * @return 日参与次数
     */
    Integer queryPartakeDayCount(Long activityId, String userId) ;
}
