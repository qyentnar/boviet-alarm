package com.boviet.web.controller.alarm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson2.JSONObject;
import com.boviet.alarm.dto.AlarmMessageDto;
import com.boviet.alarm.service.IAlarmManagerService;
import com.boviet.common.core.controller.BaseController;
import com.boviet.common.core.domain.AjaxResult;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/alarm/manager")
public class AlarmManagerController extends BaseController {

    @Autowired
    private IAlarmManagerService alarmManagerService;
    
    @ApiOperation("sendMessage")
    @PostMapping("/sendMessage")
    public AjaxResult sendMessage(@RequestHeader String AlarmCode, @RequestBody JSONObject Message) {
        AlarmMessageDto alarmMessage = new AlarmMessageDto();
        alarmMessage.setAlarmId(AlarmCode);
        alarmMessage.setAlarmMessage(Message);
        return success(alarmManagerService.sendMessage(alarmMessage));
    }
}
