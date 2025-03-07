package com.boviet.quartz.task;

import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.boviet.attendance.service.IAttendanceNotificationService;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;

@Component("AttendanceTask")
public class AttendanceTask {
    @Autowired
    private IAttendanceNotificationService attendanceNotificationService;

    public void submitAttendanceData(String lastMonth, String workcode) throws IOException {
        if(StringUtils.isEmpty(lastMonth)){
            lastMonth = DateUtils.parseDateToStr("yyyy_DD", DateUtils.truncate(DateUtils.addMonths(DateUtils.getNowDate(), -1), Calendar.MONTH));
        }
        attendanceNotificationService.submitAttendanceData(lastMonth, workcode);
    }
}
