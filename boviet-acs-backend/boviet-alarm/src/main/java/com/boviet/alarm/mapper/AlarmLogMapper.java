package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmLog;

/**
 * Alarm LogMapper接口
 * 
 * @author boviet
 * @date 2025-03-03
 */
public interface AlarmLogMapper 
{
    /**
     * 查询Alarm Log
     * 
     * @param id Alarm Log主键
     * @return Alarm Log
     */
    public AlarmLog selectAlarmLogById(Long id);

    /**
     * 查询Alarm Log列表
     * 
     * @param alarmLog Alarm Log
     * @return Alarm Log集合
     */
    public List<AlarmLog> selectAlarmLogList(AlarmLog alarmLog);

    /**
     * 新增Alarm Log
     * 
     * @param alarmLog Alarm Log
     * @return 结果
     */
    public int insertAlarmLog(AlarmLog alarmLog);

    /**
     * 修改Alarm Log
     * 
     * @param alarmLog Alarm Log
     * @return 结果
     */
    public int updateAlarmLog(AlarmLog alarmLog);

    /**
     * 删除Alarm Log
     * 
     * @param id Alarm Log主键
     * @return 结果
     */
    public int deleteAlarmLogById(Long id);

    /**
     * 批量删除Alarm Log
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmLogByIds(Long[] ids);
}
