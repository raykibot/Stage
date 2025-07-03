package com.luo.domain.activity.service;

import com.luo.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.luo.domain.activity.model.entity.UserRaffleOrderEntity;

/**
 * 抽奖活动参与服务
 *
 * 扣减抽奖次数
 */
public interface IRaffleActivityPartakeService {



    UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);




}
