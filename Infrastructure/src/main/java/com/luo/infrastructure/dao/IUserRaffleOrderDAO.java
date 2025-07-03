package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.UserRaffleOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserRaffleOrderDAO {
    int updateUserRaffleOrder(UserRaffleOrder userRaffleOrder);

    UserRaffleOrder queryNoUsedRaffleOrder(UserRaffleOrder req);

    void insert(UserRaffleOrder build);
}
