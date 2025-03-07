package com.boviet.web.controller.attendance;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boviet.attendance.service.IAttendanceNotificationService;
import com.boviet.common.core.controller.BaseController;
import com.boviet.common.core.domain.AjaxResult;

@RestController
@RequestMapping("/attendance/lastMonthReport")
public class AttendanceNotificationController extends BaseController{
    @Autowired
    private IAttendanceNotificationService attendanceNotificationService;

    @GetMapping("/getAccessToken")
    public AjaxResult getAccessToken() throws IOException{
        return success(attendanceNotificationService.submitAttendanceData("2025_01", "N7186"));
    }
}
