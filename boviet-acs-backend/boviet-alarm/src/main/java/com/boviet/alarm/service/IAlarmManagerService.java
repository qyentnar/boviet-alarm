package com.boviet.alarm.service;

import java.util.Map;

import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.dto.AlarmMessageDto;

public interface IAlarmManagerService {
    public String createAlarm(AlarmMessageDto alarmMessage);
    
    public Map<String, Object> sendMessage(AlarmAction alarmAction, String message);
}
