package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmGroupAction;

/**
 * Alarm GroupActionMapper接口
 * 
 * @author boviet
 * @date 2025-02-26
 */
public interface AlarmGroupActionMapper 
{
    /**
     * 查询Alarm GroupAction
     * 
     * @param id Alarm GroupAction主键
     * @return Alarm GroupAction
     */
    public AlarmGroupAction selectAlarmGroupActionById(Long id);

    /**
     * 查询Alarm GroupAction
     * 
     * @param id Alarm GroupAction主键
     * @return Alarm GroupAction
     */
    public List<AlarmGroupAction> selectAlarmGroupActionByGroupId(String groupId);
    
    /**
     * 查询Alarm GroupAction列表
     * 
     * @param alarmGroupAction Alarm GroupAction
     * @return Alarm GroupAction集合
     */
    public List<AlarmGroupAction> selectAlarmGroupActionList(AlarmGroupAction alarmGroupAction);

    /**
     * 新增Alarm GroupAction
     * 
     * @param alarmGroupAction Alarm GroupAction
     * @return 结果
     */
    public int insertAlarmGroupAction(AlarmGroupAction alarmGroupAction);

    /**
     * 修改Alarm GroupAction
     * 
     * @param alarmGroupAction Alarm GroupAction
     * @return 结果
     */
    public int updateAlarmGroupAction(AlarmGroupAction alarmGroupAction);

    /**
     * 删除Alarm GroupAction
     * 
     * @param id Alarm GroupAction主键
     * @return 结果
     */
    public int deleteAlarmGroupActionById(Long id);

    /**
     * 删除Alarm GroupAction
     * 
     * @param id Alarm GroupAction主键
     * @return 结果
     */
    public int deleteAlarmGroupActionByGroupId(String alarmId);

    /**
     * 批量删除Alarm GroupAction
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmGroupActionByIds(Long[] ids);
}
