package com.boviet.alarm.dto;

import java.util.Date;

import com.alibaba.fastjson2.JSONObject;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class AlarmMessageDto {
    @ApiModelProperty("Alarm ID")
    private String alarmId;

    @ApiModelProperty("Alarm Message")
    private JSONObject alarmMessage;

    @ApiModelProperty("Alarm Create Time")
    private Date createTime;
}
