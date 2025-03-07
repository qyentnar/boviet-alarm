package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmJobMapper;
import com.boviet.alarm.domain.AlarmJob;
import com.boviet.alarm.service.IAlarmJobService;

/**
 * Alarm JobService业务层处理
 * 
 * @author boviet
 * @date 2025-03-04
 */
@Service
public class AlarmJobServiceImpl implements IAlarmJobService 
{
    @Autowired
    private AlarmJobMapper alarmJobMapper;

    /**
     * 查询Alarm Job
     * 
     * @param id Alarm Job主键
     * @return Alarm Job
     */
    @Override
    public AlarmJob selectAlarmJobById(Long id)
    {
        return alarmJobMapper.selectAlarmJobById(id);
    }

    /**
     * 查询Alarm Job列表
     * 
     * @param alarmJob Alarm Job
     * @return Alarm Job
     */
    @Override
    public List<AlarmJob> selectAlarmJobList(AlarmJob alarmJob)
    {
        return alarmJobMapper.selectAlarmJobList(alarmJob);
    }

    /**
     * 新增Alarm Job
     * 
     * @param alarmJob Alarm Job
     * @return 结果
     */
    @Override
    public int insertAlarmJob(AlarmJob alarmJob)
    {
        alarmJob.setCreateTime(DateUtils.getNowDate());
        return alarmJobMapper.insertAlarmJob(alarmJob);
    }

    /**
     * 修改Alarm Job
     * 
     * @param alarmJob Alarm Job
     * @return 结果
     */
    @Override
    public int updateAlarmJob(AlarmJob alarmJob)
    {
        alarmJob.setUpdateTime(DateUtils.getNowDate());
        return alarmJobMapper.updateAlarmJob(alarmJob);
    }

    /**
     * 批量删除Alarm Job
     * 
     * @param ids 需要删除的Alarm Job主键
     * @return 结果
     */
    @Override
    public int deleteAlarmJobByIds(Long[] ids)
    {
        return alarmJobMapper.deleteAlarmJobByIds(ids);
    }

    /**
     * 删除Alarm Job信息
     * 
     * @param id Alarm Job主键
     * @return 结果
     */
    @Override
    public int deleteAlarmJobById(Long id)
    {
        return alarmJobMapper.deleteAlarmJobById(id);
    }
}
