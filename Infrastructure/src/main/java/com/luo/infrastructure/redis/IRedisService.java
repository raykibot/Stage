package com.luo.infrastructure.redis;

public interface IRedisService {


    /**
     * 设置值  redisson框架，原子性设置，避免导致并发问题
     * @param key
     * @param value
     */
    void setActomicLongValue(String key, long value);


    /**
     * 设置值 直接存储
     * @param key
     * @param value
     * @param <T>
     */
    <T>void setValue(String key, T value);


    /**
     * 获取值
     * @param key
     * @return
     * @param <T>
     */
    <T> T getValue(String key);








}
