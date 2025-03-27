package com.luo.trigger.api.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleAwardListResponseVO {


    private Integer awardId;

    private String awardTitle;

    private String awardSubTitle;

    private Integer sort;


}
