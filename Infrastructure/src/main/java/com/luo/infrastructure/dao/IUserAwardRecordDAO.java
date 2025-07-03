package com.luo.infrastructure.dao;

import com.luo.infrastructure.pojo.UserAwardRecord;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserAwardRecordDAO {


    void insert(UserAwardRecord userAwardRecord);
}
