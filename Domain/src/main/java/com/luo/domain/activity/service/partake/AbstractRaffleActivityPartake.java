package com.luo.domain.activity.service.partake;

import com.luo.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import com.luo.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.luo.domain.activity.model.entity.RaffleActivityEntity;
import com.luo.domain.activity.model.entity.UserRaffleOrderEntity;
import com.luo.domain.activity.model.vo.ActivityStateVO;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.domain.activity.service.IRaffleActivityPartakeService;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

@Slf4j
public abstract class AbstractRaffleActivityPartake implements IRaffleActivityPartakeService {

    protected final IActivityRepository activityRepository;

    public AbstractRaffleActivityPartake(IActivityRepository activityRepository) {
        this.activityRepository = activityRepository;
    }

    @Override
    public UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity) {

        String userId = partakeRaffleActivityEntity.getUserId();
        Long activityId = partakeRaffleActivityEntity.getActivityId();

        //  参数校验
        if (userId == null || activityId == null){
            throw new RuntimeException("用户ID或者活动ID为空");
        }

        //查询活动信息
        RaffleActivityEntity raffleActivityEntity = activityRepository.queryRaffleActivityEntityByActivityId(activityId);

        //活动状态检测
        if (!raffleActivityEntity.getState().equals(ActivityStateVO.open)){
            throw new RuntimeException("活动未开启");
        }

        //活动时间校验
        Date current = new Date();
        if (raffleActivityEntity.getBeginDateTime().after(current) || raffleActivityEntity.getEndDateTime().before(current)){
            throw new RuntimeException("活动时间未开始或已结束");
        }

        //查询是否有未使用的订单
        UserRaffleOrderEntity userRaffleOrder = activityRepository.queryNoUsedRaffleOrder(partakeRaffleActivityEntity);
        if (userRaffleOrder != null){
            log.info("有为使用订单 直接返回");
            //不为空则说明有未使用订单  消费未使用订单
            return userRaffleOrder;
        }

        //额度账户过滤&返回账户构建对象
        CreatePartakeOrderAggregate createPartakeOrderAggregate = doFilter(userId, activityId, current);

        //构建订单对象
        UserRaffleOrderEntity userRaffleOrderEntity = buildUserRaffleOrder(userId, activityId, current);

        //填充订单对象
        createPartakeOrderAggregate.setUserRaffleOrder(userRaffleOrderEntity);

        //保存订单对象
        activityRepository.saveCreatePartakeOrderAggregate(createPartakeOrderAggregate);

        return userRaffleOrderEntity;
    }


    protected abstract CreatePartakeOrderAggregate doFilter(String userId, Long activityId, Date current);
    protected abstract UserRaffleOrderEntity buildUserRaffleOrder(String userId, Long activityId, Date current);
}
