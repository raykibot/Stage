package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RaffleActivityAccountMonth;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IRaffleActivityAccountMonthDAO {


    RaffleActivityAccountMonth queryRaffleActivityAccountMonthByUserId(RaffleActivityAccountMonth req);

    int updateRaffleActivityAccountMonth(RaffleActivityAccountMonth build);

    void insertRaffleActivityAccountMonth(RaffleActivityAccountMonth build);

    void addAccountQuota(RaffleActivityAccountMonth monthAccount);
}
