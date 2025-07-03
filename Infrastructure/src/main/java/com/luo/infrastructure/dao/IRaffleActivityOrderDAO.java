package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RaffleActivityOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IRaffleActivityOrderDAO {


    void insert(RaffleActivityOrder raffleActivityOrder);
}
