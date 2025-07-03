package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.RaffleActivitySku;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IRaffleActivitySkuDAO {
    List<RaffleActivitySku> queryRaffleActivitySkuListByActivityId(Long activityId);

    RaffleActivitySku queryRaffleActivityBySku(Integer sku);

    void clearActivitySkuStock(Integer sku);

    void updateActivitySkuStock(Integer sku);
}
