package com.boviet.alarm.dto;

import java.util.Date;
import java.util.Map;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class AlarmMessageDto {
    @ApiModelProperty("Alarm ID")
    private String alarmId;

    @ApiModelProperty("Alarm Message")
    private Map<String, Object> alarmMessage;

    @ApiModelProperty("Alarm Create Time")
    private Date createTime;
}
