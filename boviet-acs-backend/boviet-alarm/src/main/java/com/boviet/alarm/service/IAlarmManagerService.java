package com.boviet.alarm.service;

import com.boviet.alarm.dto.AlarmMessageDto;

public interface IAlarmManagerService {
    public String sendMessage(AlarmMessageDto alarmMessage);
}
