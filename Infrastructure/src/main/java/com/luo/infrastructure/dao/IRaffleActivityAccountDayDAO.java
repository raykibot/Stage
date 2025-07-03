package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RaffleActivityAccount;
import com.luo.infrastructure.pojo.RaffleActivityAccountDay;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IRaffleActivityAccountDayDAO {
    RaffleActivityAccountDay queryRaffleActivityAccountDayByUserId(RaffleActivityAccountDay req);

    int updateRaffleActivityAccountDay(RaffleActivityAccountDay build);

    void insertRaffleActivityAccountDay(RaffleActivityAccountDay build);

    Integer queryRaffleActivityAccountDayCount(RaffleActivityAccountDay raffleActivityAccountDay);

    void addAccountQuota(RaffleActivityAccountDay dayAccount);
}
