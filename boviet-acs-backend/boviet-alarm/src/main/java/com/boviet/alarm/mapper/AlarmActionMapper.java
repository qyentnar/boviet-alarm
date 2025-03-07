package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmAction;

/**
 * Alarm ActionMapper接口
 * 
 * @author boviet
 * @date 2025-02-25
 */
public interface AlarmActionMapper 
{
    /**
     * 查询Alarm Action
     * 
     * @param id Alarm Action主键
     * @return Alarm Action
     */
    public AlarmAction selectAlarmActionById(Long id);

    /**
     * 查询Alarm Action
     * 
     * @param id Alarm Action主键
     * @return Alarm Action
     */
    public AlarmAction selectAlarmActionByActionId(String actionId);

    /**
     * 查询Alarm Action列表
     * 
     * @param alarmAction Alarm Action
     * @return Alarm Action集合
     */
    public List<AlarmAction> selectAlarmActionList(AlarmAction alarmAction);

    /**
     * 新增Alarm Action
     * 
     * @param alarmAction Alarm Action
     * @return 结果
     */
    public int insertAlarmAction(AlarmAction alarmAction);

    /**
     * 修改Alarm Action
     * 
     * @param alarmAction Alarm Action
     * @return 结果
     */
    public int updateAlarmAction(AlarmAction alarmAction);

    /**
     * 删除Alarm Action
     * 
     * @param id Alarm Action主键
     * @return 结果
     */
    public int deleteAlarmActionById(Long id);

    /**
     * 批量删除Alarm Action
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmActionByIds(Long[] ids);
}
