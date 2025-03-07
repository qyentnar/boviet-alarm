package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmMainGroup;

/**
 * Alarm Main GroupMapper接口
 * 
 * @author boviet
 * @date 2025-02-28
 */
public interface AlarmMainGroupMapper 
{
    /**
     * 查询Alarm Main Group
     * 
     * @param id Alarm Main Group主键
     * @return Alarm Main Group
     */
    public AlarmMainGroup selectAlarmMainGroupById(Long id);

    /**
     * 查询Alarm Main Group
     * 
     * @param id Alarm Main Group主键
     * @return Alarm Main Group
     */
    public List<AlarmMainGroup> selectAlarmMainGroupByAlarmId(String alarmId);

    /**
     * 查询Alarm Main Group列表
     * 
     * @param alarmMainGroup Alarm Main Group
     * @return Alarm Main Group集合
     */
    public List<AlarmMainGroup> selectAlarmMainGroupList(AlarmMainGroup alarmMainGroup);

    /**
     * 新增Alarm Main Group
     * 
     * @param alarmMainGroup Alarm Main Group
     * @return 结果
     */
    public int insertAlarmMainGroup(AlarmMainGroup alarmMainGroup);

    /**
     * 修改Alarm Main Group
     * 
     * @param alarmMainGroup Alarm Main Group
     * @return 结果
     */
    public int updateAlarmMainGroup(AlarmMainGroup alarmMainGroup);

    /**
     * 删除Alarm Main Group
     * 
     * @param id Alarm Main Group主键
     * @return 结果
     */
    public int deleteAlarmMainGroupById(Long id);

    /**
     * 删除Alarm Main Group
     * 
     * @param id Alarm Main Group主键
     * @return 结果
     */
    public int deleteAlarmMainGroupByAlarmId(String alarmId);

    /**
     * 批量删除Alarm Main Group
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmMainGroupByIds(Long[] ids);
}
