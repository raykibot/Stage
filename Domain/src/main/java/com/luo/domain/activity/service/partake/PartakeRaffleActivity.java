package com.luo.domain.activity.service.partake;

import com.luo.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import com.luo.domain.activity.model.entity.*;
import com.luo.domain.activity.model.vo.UserRaffleStateVO;
import com.luo.domain.activity.repository.IActivityRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class PartakeRaffleActivity extends AbstractRaffleActivityPartake{

    private final SimpleDateFormat dateFormatMonth = new SimpleDateFormat("yyyy-MM");
    private final SimpleDateFormat dateFormatDay = new SimpleDateFormat("yyyy-MM-dd");

    public PartakeRaffleActivity(IActivityRepository activityRepository) {
        super(activityRepository);
    }

    @Override
    protected CreatePartakeOrderAggregate doFilter(String userId, Long activityId, Date current) {

        //查询总账户
        RaffleActivityAccountEntity raffleActivityAccount = activityRepository.queryRaffleActivityAccountEntityByuserId(userId, activityId);

        if (raffleActivityAccount == null || raffleActivityAccount.getTotalCountSurplus() <= 0){
            throw new RuntimeException("总账户额度不足");
        }

        String month = dateFormatMonth.format(current);
        String day = dateFormatDay.format(current);

        //查询月账户
        RaffleActivityAccountMonthEntity raffleActivityAccountMonth = activityRepository.queryRaffleActivityAccountMonthByUserId(userId, activityId, month);
        if (raffleActivityAccountMonth != null && raffleActivityAccountMonth.getMonthCountSurplus() <= 0){
            throw new RuntimeException("用户月账户额度不足");
        }

        boolean isExistAccountMonth = raffleActivityAccountMonth != null;
        //月账户为空则创建月账户
        if(raffleActivityAccountMonth == null){
            raffleActivityAccountMonth = new RaffleActivityAccountMonthEntity();
            raffleActivityAccountMonth.setUserId(userId);
            raffleActivityAccountMonth.setActivityId(activityId);
            raffleActivityAccountMonth.setMonth(month);
            raffleActivityAccountMonth.setMonthCount(raffleActivityAccount.getMonthCount());
            raffleActivityAccountMonth.setMonthCountSurplus(raffleActivityAccount.getMonthCountSurplus());
        }

        //查询日账户
        RaffleActivityAccountDayEntity raffleActivityAccountDay = activityRepository.queryRaffleActivityAccountDayByUserId(userId, activityId, day);
        if (raffleActivityAccountDay != null && raffleActivityAccountDay.getDayCountSurplus() <= 0){
            throw new RuntimeException("用户日账户额度不足");
        }

        boolean isExistAccountDay = raffleActivityAccountDay != null;
        //日账户为空则创建日账户
        if (raffleActivityAccountDay == null){
            raffleActivityAccountDay = new RaffleActivityAccountDayEntity();
            raffleActivityAccountDay.setUserId(userId);
            raffleActivityAccountDay.setActivityId(activityId);
            raffleActivityAccountDay.setDay(day);
            raffleActivityAccountDay.setDayCount(raffleActivityAccount.getDayCount());
            raffleActivityAccountDay.setDayCountSurplus(raffleActivityAccount.getDayCountSurplus());
        }

        //构建对象
        return CreatePartakeOrderAggregate.builder()
                .userId(userId)
                .activityId(activityId)
                .raffleActivityAccountEntity(raffleActivityAccount)
                .isMonthAccount(isExistAccountMonth)
                .raffleActivityAccountMonthEntity(raffleActivityAccountMonth)
                .isDayAccount(isExistAccountDay)
                .raffleActivityAccountDayEntity(raffleActivityAccountDay)
                .build();
    }

    @Override
    protected UserRaffleOrderEntity buildUserRaffleOrder(String userId, Long activityId, Date current) {
        RaffleActivityEntity raffleActivityEntity = activityRepository.queryRaffleActivityEntityByActivityId(activityId);
        UserRaffleOrderEntity userRaffleOrderEntity = new UserRaffleOrderEntity();
        userRaffleOrderEntity.setUserId(userId);
        userRaffleOrderEntity.setActivityId(activityId);
        userRaffleOrderEntity.setActivityName(raffleActivityEntity.getActivityName());
        userRaffleOrderEntity.setStrategyId(raffleActivityEntity.getStrategyId());
        userRaffleOrderEntity.setOrderState(UserRaffleStateVO.create);
        userRaffleOrderEntity.setOrderTime(current);
        userRaffleOrderEntity.setOrderId(RandomStringUtils.randomNumeric(12));

        return userRaffleOrderEntity;
    }
}
