package com.luo.domain.strategy.service;


import com.luo.domain.strategy.model.entity.RaffleAwardEntity;
import com.luo.domain.strategy.model.entity.RaffleFactorEntity;

/**
 * 总体抽奖流程
 */
public interface IRaffleStrategy {




    RaffleAwardEntity performRaffle(RaffleFactorEntity raffleFactorEntity);




}
