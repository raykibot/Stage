package com.luo.domain.award.repository;

import com.luo.domain.award.model.aggregate.UserAwardRecordAggregate;

public interface IAwardRepository {

    void saveUserAwardRecordAggregate(UserAwardRecordAggregate userAwardRecordAggregate);
}
