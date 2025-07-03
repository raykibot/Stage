package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RaffleActivityAccount;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IRaffleActivityAccountDAO {

    int updateAccount(RaffleActivityAccount raffleActivityAccount);

    void insert(RaffleActivityAccount raffleActivityAccount);

    RaffleActivityAccount queryRaffleActivityAccount(RaffleActivityAccount raffleActivityAccount);

    int updateRaffleActivityAccount(RaffleActivityAccount build);

    void updateAccountMonthCountSurplus(RaffleActivityAccount build);

    void updateAccountMonthCountSurplusImage(RaffleActivityAccount build);

    void updateAccountDayCountSurplusImage(RaffleActivityAccount build);
}
