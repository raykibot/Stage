package com.luo.domain.activity.service.quota;

import com.luo.domain.activity.model.aggregate.CreatQuotaOrderAggregate;
import com.luo.domain.activity.model.entity.*;
import com.luo.domain.activity.repository.IActivityRepository;
import com.luo.domain.activity.service.IRaffleActivityAccountQuotaService;
import com.luo.domain.activity.service.quota.rule.IActionChain;
import com.luo.domain.activity.service.quota.rule.factory.DefaultActionChainFactory;

public abstract class AbstractRaffleActivityAccountQuota extends RaffleActivityAccountQuotaSupport implements IRaffleActivityAccountQuotaService {


    public AbstractRaffleActivityAccountQuota(IActivityRepository activityRepository, DefaultActionChainFactory defaultActionChainFactory) {
        super(activityRepository, defaultActionChainFactory);
    }

    @Override
    public String createOrder(SkuRechargeEntity skuRechargeEntity) {

        //1.校验参数
        Integer sku = skuRechargeEntity.getSku();

        if (skuRechargeEntity.getUserId() == null || skuRechargeEntity.getOutBusinessOutNo().isBlank()){
            throw new RuntimeException("下单参数异常");
        }

        //2.查询活动信息

        //查询sku实体类信息
        RaffleActivitySkuEntity raffleActivitySkuEntity = queryRaffleActivityEntityBySku(sku);

        //查询活动实体信息
        RaffleActivityEntity activityEntity = queryRaffleActivityEntityByActivityId(raffleActivitySkuEntity.getActivityId());

        //查询活动次数信息
        RaffleActivityCountEntity raffleActivityCountEntity = queryRaffleActivityCountEntityByActivityCountId(raffleActivitySkuEntity.getActivityCountId());

        //活动规则校验
        IActionChain actionChain = defaultActionChainFactory.openActionChain();
        actionChain.action(activityEntity, raffleActivitySkuEntity, raffleActivityCountEntity);

        //创建聚合对象
        CreatQuotaOrderAggregate createQuotaOrderAggregate = buildCreateQuotaOrderAggregate(activityEntity, raffleActivitySkuEntity, raffleActivityCountEntity,skuRechargeEntity);

        doSaveOrder(createQuotaOrderAggregate);

        return createQuotaOrderAggregate.getRaffleActivityOrderEntity().getOrderId();
    }

    protected abstract CreatQuotaOrderAggregate buildCreateQuotaOrderAggregate(RaffleActivityEntity activityEntity, RaffleActivitySkuEntity raffleActivitySkuEntity, RaffleActivityCountEntity raffleActivityCountEntity, SkuRechargeEntity skuRechargeEntity);

    protected abstract void doSaveOrder(CreatQuotaOrderAggregate createQuotaOrderAggregate);
}
