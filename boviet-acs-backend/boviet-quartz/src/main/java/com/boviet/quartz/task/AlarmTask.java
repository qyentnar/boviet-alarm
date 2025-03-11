package com.boviet.quartz.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson2.JSONObject;
import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.domain.AlarmGroup;
import com.boviet.alarm.domain.AlarmJob;
import com.boviet.alarm.domain.AlarmLog;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.enums.JobStatusEnum;
import com.boviet.alarm.enums.LogStatusEnum;
import com.boviet.alarm.enums.LogTypeEnum;
import com.boviet.alarm.enums.JobSeverityEnum;
import com.boviet.alarm.service.IAlarmGroupService;
import com.boviet.alarm.service.IAlarmJobService;
import com.boviet.alarm.service.IAlarmLogService;
import com.boviet.alarm.service.IAlarmMainService;
import com.boviet.alarm.service.IAlarmManagerService;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;

@Component("AlarmTask")
public class AlarmTask {

    @Autowired
    private IAlarmJobService alarmJobService;

    @Autowired
    private IAlarmMainService alarmMainService;
    @Autowired
    private IAlarmLogService alarmLogService;

    @Autowired
    private IAlarmGroupService alarmGroupService;

    @Autowired
    private IAlarmManagerService alarmManagerService;

    public void RunJobWaiting() {
        this.RunJob(JobSeverityEnum.CRITICAL.getCode(), JobStatusEnum.WAIT);
    }

    public void RunJobWaiting(Integer severity) {
        if (StringUtils.isNull(severity)) {
            severity = JobSeverityEnum.CRITICAL.getCode();
        }
        this.RunJob(severity, JobStatusEnum.WAIT);
    }

    public void RunJobFail(Integer severity) {
        this.RunJob(severity, JobStatusEnum.FAIL);
    }

    private void RunJob(Integer severity, JobStatusEnum status) {
        AlarmJob alarmJob = new AlarmJob();
        alarmJob.setSeverity(severity);
        alarmJob.setStatus(status.getCode());
        List<AlarmJob> jobs = alarmJobService.selectAlarmJobList(alarmJob);
        for (AlarmJob job : jobs) {
            AlarmGroup group = alarmGroupService.selectAlarmGroupByGroupId(job.getGroupId());
            AlarmMain main = alarmMainService.selectAlarmMainByAlarmId(job.getAlarmId());
            
            AlarmLog alarmLog = new AlarmLog();
            alarmLog.setAlarmId(job.getAlarmId());
            alarmLog.setLogType(LogTypeEnum.OUTGOING.getCode());
            alarmLog.setSystemName(StringUtils.isNull(main) ? "" : main.getSystemName());
            alarmLog.setCreateTime(DateUtils.getNowDate());
            alarmLog.setRequestTime(DateUtils.getNowDate());
            Map<String, Object> result = new HashMap<String, Object>();
            try{
                List<AlarmAction> actions = group.getActions();
                for (AlarmAction action : actions) {
                    result = alarmManagerService.sendMessage(action, job.getMessage());
                }
                job.setStatus(JobStatusEnum.SENT.getCode());
                alarmLog.setStatus(LogStatusEnum.SUCCESS.getCode()); // 0 Error, 1 Success
                alarmLog.setResponseData(JSONObject.toJSONString(result));
            }
            catch (Exception e){
                job.setStatus(JobStatusEnum.FAIL.getCode());

                Map<String, Object> error = new HashMap<String, Object>();
                error.put("code", -1);
                error.put("message", e.getMessage());
                alarmLog.setStatus(LogStatusEnum.ERROR.getCode());
                alarmLog.setResponseData(JSONObject.toJSONString(error));
            }
            finally {
                alarmJobService.updateAlarmJob(job);

                // 保存日志
                alarmLog.setRequestData(job.getMessage());
                alarmLog.setResponseTime(DateUtils.getNowDate());
                Long timeout = alarmLog.getResponseTime().getTime() - alarmLog.getCreateTime().getTime();
                alarmLog.setTimeOut(timeout);
                alarmLog.setRemark(job.getRemark());
                alarmLogService.insertAlarmLog(alarmLog);
            }
        }
    }
}
