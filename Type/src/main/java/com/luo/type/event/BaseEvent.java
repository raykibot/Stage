package com.luo.type.event;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
public abstract class BaseEvent <T>{

    public abstract EventMessage<T> build(T data);

    public abstract String topic();



    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class EventMessage<T>{
        private String id;
        private Date timestamp;
        private T data;
    }

}
