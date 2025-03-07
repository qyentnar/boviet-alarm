package com.boviet.attendance.service;

import java.io.IOException;

import com.alibaba.fastjson2.JSONObject;

public interface IAttendanceNotificationService {
    public JSONObject submitAttendanceData(String lastMonth, String workcode) throws IOException;
}
