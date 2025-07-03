package com.luo.test.domain;

import com.luo.trigger.api.IRaffleActivityService;
import com.luo.type.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class CalendarSignRebateTest {


    @Autowired
    private IRaffleActivityService raffleActivityService;

    @Test
    public void test_calendarSignRebate(){
        Response<Boolean> response = raffleActivityService.calendarSignRebate("luojiakeng");
        log.info("日历签到返利结果:{}", response);
    }


}
