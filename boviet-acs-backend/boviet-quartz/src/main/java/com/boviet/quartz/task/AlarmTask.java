package com.boviet.quartz.task;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.domain.AlarmGroup;
import com.boviet.alarm.domain.AlarmJob;
import com.boviet.alarm.domain.AlarmLog;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.enums.JobStatusEnum;
import com.boviet.alarm.enums.LogStatusEnum;
import com.boviet.alarm.enums.LogTypeEnum;
import com.boviet.alarm.enums.JobSeverityEnum;
import com.boviet.alarm.service.IAlarmActionService;
import com.boviet.alarm.service.IAlarmJobService;
import com.boviet.alarm.service.IAlarmLogService;
import com.boviet.alarm.service.IAlarmMainService;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;

@Component("AlarmTask")
public class AlarmTask {

    @Autowired
    private IAlarmJobService alarmJobService;

    @Autowired
    private IAlarmMainService alarmMainService;

    @Autowired
    private IAlarmActionService actionService;

    @Autowired
    private IAlarmLogService alarmLogService;

    public void RunJobWaiting(){
        this.RunJob(JobSeverityEnum.CRITICAL.getCode(), JobStatusEnum.WAIT);
    }

    public void RunJobWaiting(Integer severity){
        if(StringUtils.isNull(severity)){
            severity = JobSeverityEnum.CRITICAL.getCode();
        }
        this.RunJob(severity, JobStatusEnum.WAIT);
    }

    public void RunJobFail(Integer severity){
        this.RunJob(severity, JobStatusEnum.FAIL);
    }

    private void RunJob(Integer severity, JobStatusEnum status){
        AlarmJob alarmJob = new AlarmJob();
        alarmJob.setSeverity(severity);
        alarmJob.setStatus(status.getCode());
        List<AlarmJob> jobs = alarmJobService.selectAlarmJobList(alarmJob);
        for (AlarmJob job : jobs) {
            AlarmMain alarmMain = alarmMainService.selectAlarmMainByAlarmId(job.getAlarmId());
            List<AlarmGroup> groups = alarmMain.getGroups();
            for (AlarmGroup group : groups) {
                List<AlarmAction> actions = group.getActions();
                for (AlarmAction action : actions) {
                    AlarmLog alarmLog = new AlarmLog();
                    alarmLog.setAlarmId(job.getAlarmId());
                    alarmLog.setLogType(LogTypeEnum.OUTGOING.getCode());
                    alarmLog.setSystemName(action.getActionType());
                    alarmLog.setCreateTime(DateUtils.getNowDate());
                    alarmLog.setRequestTime(DateUtils.getNowDate());

                    alarmJob = new AlarmJob();
                    alarmJob.setId(job.getId());
                    Map<String, Object> result = actionService.sendMessage(action, job.getMessage());//更新job状态
                    if(StringUtils.contains(result.get("code").toString(), "-1")){
                        alarmJob.setStatus(JobStatusEnum.FAIL.getCode()); //1未发送，0已发送，-1发送失败
                        alarmLog.setStatus(LogStatusEnum.ERROR.getCode()); //0 Error, 1 Success
                    }else{
                        alarmJob.setStatus(JobStatusEnum.SENT.getCode()); //1未发送，0已发送，-1发送失败
                        alarmLog.setStatus(LogStatusEnum.SUCCESS.getCode()); //0 Error, 1 Success
                    }
                    //更新job状态
                    alarmJobService.updateAlarmJob(alarmJob);

                    //保存日志
                    alarmLog.setRequestData(result.get("request_data").toString());
                    alarmLog.setResponseData(result.get("response_data").toString());
                    alarmLog.setResponseTime(DateUtils.getNowDate());
                    Long timeout = alarmLog.getResponseTime().getTime() - alarmLog.getCreateTime().getTime();
                    alarmLog.setTimeOut(timeout);
                    alarmLog.setRemark(job.getRemark());
                    alarmLogService.insertAlarmLog(alarmLog);
                }
            }
        }
    }

}
