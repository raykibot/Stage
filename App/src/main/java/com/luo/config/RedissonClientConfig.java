package com.luo.config;


import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONReader;
import com.alibaba.fastjson2.JSONWriter;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufAllocator;
import io.netty.buffer.ByteBufInputStream;
import io.netty.buffer.ByteBufOutputStream;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.client.codec.BaseCodec;
import org.redisson.client.codec.Codec;
import org.redisson.client.protocol.Decoder;
import org.redisson.client.protocol.Encoder;
import org.redisson.config.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RedissonClientConfig {

    @Bean
    public RedissonClient redissonClient() {
        Config config = new Config();
        Codec codec = new Fastjson2Codec();  // 使用 Fastjson2 作为序列化器
        config.setCodec(codec);
        config.useSingleServer()
                .setAddress("redis://127.0.0.1:6379");
        return Redisson.create(config);
    }

    // 静态内部类：Fastjson2 Codec 实现
    public static class Fastjson2Codec extends BaseCodec {

        private final Encoder encoder = in -> {
            ByteBuf out = ByteBufAllocator.DEFAULT.buffer();
            try (ByteBufOutputStream os = new ByteBufOutputStream(out)) {
                JSON.writeTo(os, in, JSONWriter.Feature.WriteClassName);
                return os.buffer();
            }
        };

        private final Decoder<Object> decoder = (buf, state) -> {
            try (ByteBufInputStream is = new ByteBufInputStream(buf)) {
                return JSON.parseObject(is, Object.class, JSONReader.Feature.SupportAutoType);
            }
        };

        @Override
        public Decoder<Object> getValueDecoder() {
            return decoder;
        }

        @Override
        public Encoder getValueEncoder() {
            return encoder;
        }
    }

}
