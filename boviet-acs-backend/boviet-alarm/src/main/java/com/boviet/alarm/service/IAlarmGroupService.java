package com.boviet.alarm.service;

import java.util.List;
import com.boviet.alarm.domain.AlarmGroup;

/**
 * Alarm GroupService接口
 * 
 * @author boviet
 * @date 2025-02-25
 */
public interface IAlarmGroupService 
{
    /**
     * 查询Alarm Group
     * 
     * @param id Alarm Group主键
     * @return Alarm Group
     */
    public AlarmGroup selectAlarmGroupById(Long id);

    /**
     * 查询Alarm Group列表
     * 
     * @param alarmGroup Alarm Group
     * @return Alarm Group集合
     */
    public List<AlarmGroup> selectAlarmGroupList(AlarmGroup alarmGroup);

    /**
     * 新增Alarm Group
     * 
     * @param alarmGroup Alarm Group
     * @return 结果
     */
    public int insertAlarmGroup(AlarmGroup alarmGroup);

    /**
     * 修改Alarm Group
     * 
     * @param alarmGroup Alarm Group
     * @return 结果
     */
    public int updateAlarmGroup(AlarmGroup alarmGroup);

    /**
     * 批量删除Alarm Group
     * 
     * @param ids 需要删除的Alarm Group主键集合
     * @return 结果
     */
    public int deleteAlarmGroupByIds(Long[] ids);

    /**
     * 删除Alarm Group信息
     * 
     * @param id Alarm Group主键
     * @return 结果
     */
    public int deleteAlarmGroupById(Long id);
}
