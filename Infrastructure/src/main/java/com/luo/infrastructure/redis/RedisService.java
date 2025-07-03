package com.luo.infrastructure.redis;





import org.redisson.api.RBlockingQueue;
import org.redisson.api.RBucket;
import org.redisson.api.RDelayedQueue;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;


@Service
public class RedisService implements IRedisService {

    @Resource
    private RedissonClient redissonClient;


    @Override
    public void setActomicLongValue(String key, long value) {
        redissonClient.getAtomicLong(key).set(value);
    }

    @Override
    public boolean isExists(String key) {
        return redissonClient.getBucket(key).isExists();
    }

    @Override
    public void setAtomicLong(String key, long value) {
        redissonClient.getAtomicLong(key).set(value);
    }

    @Override
    public <T> void setValue(String key, T value) {
        redissonClient.getBucket(key).set(value);
    }

    @Override
    public <T> T getValue(String key) {
        RBucket<T> bucket = redissonClient.getBucket(key);
        return bucket.get();
    }

    @Override
    public Long getAtomicLong(String key) {
        return redissonClient.getAtomicLong(key).get();
    }

    @Override
    public long decr(String key) {
        return redissonClient.getAtomicLong(key).decrementAndGet();
    }

    @Override
    public Boolean setNx(String key) {
        return redissonClient.getBucket(key).trySet("lock");
    }

    @Override
    public Boolean setNx(String key, long time, TimeUnit timeUnit) {
        return redissonClient.getBucket(key).trySet("lock", time, timeUnit);
    }

    @Override
    public <T> RBlockingQueue<T> getBlockingDeque(String key) {
        return redissonClient.getBlockingQueue(key);
    }

    @Override
    public <T> RDelayedQueue<T> getDelayedQueue(RBlockingQueue<T> blockingQueue) {
        return redissonClient.getDelayedQueue(blockingQueue);
    }
}
