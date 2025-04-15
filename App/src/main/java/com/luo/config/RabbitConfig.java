package com.luo.config;

import com.luo.type.constants.Commons;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class RabbitConfig {



    //延迟交换机
    @Bean
    public DirectExchange delayExchange(){
        return new DirectExchange(Commons.DELAY_EXCHANGE);
    }

    //死信交换机
    @Bean
    public DirectExchange deadLetterExchange(){
        return new DirectExchange(Commons.DEAD_LETTER_EXCHANGE);
    }

    //延迟队列（带TTL+死信配置）
    @Bean
    public Queue delayQueue(){
        Map<String,Object> args = new HashMap<>();
        args.put("x-dead-letter-exchange", Commons.DEAD_LETTER_EXCHANGE); // 死信交换机
        args.put("x-dead-letter-routing-key", Commons.DEAD_LETTER_ROUTING_KEY); // 死信路由键
        args.put("x-message-ttl", 15000); // TTL：15秒后转发
        return new Queue(Commons.DELAY_QUEUE, true, false, false, args);
    }

    @Bean
    public Queue deadLetterQueue() {
        return new Queue(Commons.DEAD_LETTER_QUEUE); // 最终消费队列
    }

    //绑定延迟队列到交换机
    @Bean
    public Binding delayBinding(){
        return BindingBuilder.bind(delayQueue()).to(delayExchange()).with(Commons.DELAY_ROUTING_KEY);
    }

    //绑定死信队列到交换机
    @Bean
    public Binding deadLetterBinding() {
        return BindingBuilder.bind(deadLetterQueue()).to(deadLetterExchange()).with(Commons.DEAD_LETTER_ROUTING_KEY);
    }

}
