package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmJob;

/**
 * Alarm JobMapper接口
 * 
 * @author boviet
 * @date 2025-03-04
 */
public interface AlarmJobMapper 
{
    /**
     * 查询Alarm Job
     * 
     * @param id Alarm Job主键
     * @return Alarm Job
     */
    public AlarmJob selectAlarmJobById(Long id);

    /**
     * 查询Alarm Job列表
     * 
     * @param alarmJob Alarm Job
     * @return Alarm Job集合
     */
    public List<AlarmJob> selectAlarmJobList(AlarmJob alarmJob);

    /**
     * 新增Alarm Job
     * 
     * @param alarmJob Alarm Job
     * @return 结果
     */
    public int insertAlarmJob(AlarmJob alarmJob);

    /**
     * 修改Alarm Job
     * 
     * @param alarmJob Alarm Job
     * @return 结果
     */
    public int updateAlarmJob(AlarmJob alarmJob);

    /**
     * 删除Alarm Job
     * 
     * @param id Alarm Job主键
     * @return 结果
     */
    public int deleteAlarmJobById(Long id);

    /**
     * 批量删除Alarm Job
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmJobByIds(Long[] ids);
}
