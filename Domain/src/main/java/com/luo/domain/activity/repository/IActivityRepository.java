package com.luo.domain.activity.repository;

import com.luo.domain.activity.model.aggregate.CreatQuotaOrderAggregate;
import com.luo.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import com.luo.domain.activity.model.entity.*;
import com.luo.domain.activity.model.vo.ActivitySkuStockVO;

import java.util.Date;
import java.util.List;

public interface IActivityRepository {



    void activitySkuConsumeSendQueue(ActivitySkuStockVO build);

    Boolean subtractStock(Integer sku, String caCheKey, Date endDateTime);

    void savOrder(CreatQuotaOrderAggregate createQuotaOrderAggregate);

    List<RaffleActivitySkuEntity> queryRaffleActivitySkuListByActivityId(Long activityId);

    RaffleActivityCountEntity queryRaffleActivityCountEntityByActivityCountId(Long activityCountId);

    RaffleActivityEntity queryRaffleActivityEntityByActivityId(Long activityId);

    void caChKeyRaffleActivitySkuStockCount(String caCheKey, Integer count);

    RaffleActivitySkuEntity queryRaffleActivityEntityBySku(Integer sku);

    void clearActivitySkuStock(Integer sku);

    void clearQueueValue();

    ActivitySkuStockVO takeQueueValue();

    void updateActivitySkuStock(Integer sku);

    UserRaffleOrderEntity queryNoUsedRaffleOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);

    RaffleActivityAccountEntity queryRaffleActivityAccountEntityByuserId(String userId, Long activityId);

    RaffleActivityAccountMonthEntity queryRaffleActivityAccountMonthByUserId(String userId, Long activityId, String month);

    RaffleActivityAccountDayEntity queryRaffleActivityAccountDayByUserId(String userId, Long activityId, String day);

    void saveCreatePartakeOrderAggregate(CreatePartakeOrderAggregate createPartakeOrderAggregate);

    Integer queryRaffleActivityAccountDayCount(Long activityId, String userId);
}
