package com.luo.trigger.api.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleResponseVO {


    private Integer awardId;

    private Integer awardIndex;

}
