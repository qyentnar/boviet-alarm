package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmLogMapper;
import com.boviet.alarm.domain.AlarmLog;
import com.boviet.alarm.service.IAlarmLogService;

/**
 * Alarm LogService业务层处理
 * 
 * @author boviet
 * @date 2025-03-03
 */
@Service
public class AlarmLogServiceImpl implements IAlarmLogService 
{
    @Autowired
    private AlarmLogMapper alarmLogMapper;

    /**
     * 查询Alarm Log
     * 
     * @param id Alarm Log主键
     * @return Alarm Log
     */
    @Override
    public AlarmLog selectAlarmLogById(Long id)
    {
        return alarmLogMapper.selectAlarmLogById(id);
    }

    /**
     * 查询Alarm Log列表
     * 
     * @param alarmLog Alarm Log
     * @return Alarm Log
     */
    @Override
    public List<AlarmLog> selectAlarmLogList(AlarmLog alarmLog)
    {
        return alarmLogMapper.selectAlarmLogList(alarmLog);
    }

    /**
     * 新增Alarm Log
     * 
     * @param alarmLog Alarm Log
     * @return 结果
     */
    @Override
    public int insertAlarmLog(AlarmLog alarmLog)
    {
        alarmLog.setCreateTime(DateUtils.getNowDate());
        return alarmLogMapper.insertAlarmLog(alarmLog);
    }

    /**
     * 修改Alarm Log
     * 
     * @param alarmLog Alarm Log
     * @return 结果
     */
    @Override
    public int updateAlarmLog(AlarmLog alarmLog)
    {
        alarmLog.setUpdateTime(DateUtils.getNowDate());
        return alarmLogMapper.updateAlarmLog(alarmLog);
    }

    /**
     * 批量删除Alarm Log
     * 
     * @param ids 需要删除的Alarm Log主键
     * @return 结果
     */
    @Override
    public int deleteAlarmLogByIds(Long[] ids)
    {
        return alarmLogMapper.deleteAlarmLogByIds(ids);
    }

    /**
     * 删除Alarm Log信息
     * 
     * @param id Alarm Log主键
     * @return 结果
     */
    @Override
    public int deleteAlarmLogById(Long id)
    {
        return alarmLogMapper.deleteAlarmLogById(id);
    }
}
