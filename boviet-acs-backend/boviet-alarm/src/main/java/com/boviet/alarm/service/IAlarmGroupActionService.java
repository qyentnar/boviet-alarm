package com.boviet.alarm.service;

import java.util.List;
import com.boviet.alarm.domain.AlarmGroupAction;

/**
 * Alarm Group ActionService接口
 * 
 * @author boviet
 * @date 2025-02-26
 */
public interface IAlarmGroupActionService 
{
    /**
     * 查询Alarm Group Action
     * 
     * @param id Alarm Group Action主键
     * @return Alarm Group Action
     */
    public AlarmGroupAction selectAlarmGroupActionById(Long id);

    /**
     * 查询Alarm Group Action列表
     * 
     * @param alarmGroup Action Alarm Group Action
     * @return Alarm Group Action集合
     */
    public List<AlarmGroupAction> selectAlarmGroupActionList(AlarmGroupAction alarmGroupAction);

    /**
     * 新增Alarm Group Action
     * 
     * @param alarmGroup Action Alarm Group Action
     * @return 结果
     */
    public int insertAlarmGroupAction(AlarmGroupAction alarmGroupAction);

    /**
     * 修改Alarm Group Action
     * 
     * @param alarmGroup Action Alarm Group Action
     * @return 结果
     */
    public int updateAlarmGroupAction(AlarmGroupAction alarmGroupAction);

    /**
     * 批量删除Alarm Group Action
     * 
     * @param ids 需要删除的Alarm Group Action主键集合
     * @return 结果
     */
    public int deleteAlarmGroupActionByIds(Long[] ids);

    /**
     * 删除Alarm Group Action信息
     * 
     * @param id Alarm Group Action主键
     * @return 结果
     */
    public int deleteAlarmGroupActionById(Long id);
}
