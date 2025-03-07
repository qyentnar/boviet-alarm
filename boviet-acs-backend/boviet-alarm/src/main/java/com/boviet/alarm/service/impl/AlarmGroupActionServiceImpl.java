package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmGroupActionMapper;
import com.boviet.alarm.domain.AlarmGroupAction;
import com.boviet.alarm.service.IAlarmGroupActionService;

/**
 * Alarm GroupActionService业务层处理
 * 
 * @author boviet
 * @date 2025-02-26
 */
@Service
public class AlarmGroupActionServiceImpl implements IAlarmGroupActionService 
{
    @Autowired
    private AlarmGroupActionMapper alarmGroupActionMapper;

    /**
     * 查询Alarm GroupAction
     * 
     * @param id Alarm GroupAction主键
     * @return Alarm GroupAction
     */
    @Override
    public AlarmGroupAction selectAlarmGroupActionById(Long id)
    {
        return alarmGroupActionMapper.selectAlarmGroupActionById(id);
    }

    /**
     * 查询Alarm GroupAction列表
     * 
     * @param alarmGroupAction Alarm GroupAction
     * @return Alarm GroupAction
     */
    @Override
    public List<AlarmGroupAction> selectAlarmGroupActionList(AlarmGroupAction alarmGroupAction)
    {
        return alarmGroupActionMapper.selectAlarmGroupActionList(alarmGroupAction);
    }

    /**
     * 新增Alarm GroupAction
     * 
     * @param alarmGroupAction Alarm GroupAction
     * @return 结果
     */
    @Override
    public int insertAlarmGroupAction(AlarmGroupAction alarmGroupAction)
    {
        alarmGroupAction.setCreateTime(DateUtils.getNowDate());
        return alarmGroupActionMapper.insertAlarmGroupAction(alarmGroupAction);
    }

    /**
     * 修改Alarm GroupAction
     * 
     * @param alarmGroupAction Alarm GroupAction
     * @return 结果
     */
    @Override
    public int updateAlarmGroupAction(AlarmGroupAction alarmGroupAction)
    {
        alarmGroupAction.setUpdateTime(DateUtils.getNowDate());
        return alarmGroupActionMapper.updateAlarmGroupAction(alarmGroupAction);
    }

    /**
     * 批量删除Alarm GroupAction
     * 
     * @param ids 需要删除的Alarm GroupAction主键
     * @return 结果
     */
    @Override
    public int deleteAlarmGroupActionByIds(Long[] ids)
    {
        return alarmGroupActionMapper.deleteAlarmGroupActionByIds(ids);
    }

    /**
     * 删除Alarm GroupAction信息
     * 
     * @param id Alarm GroupAction主键
     * @return 结果
     */
    @Override
    public int deleteAlarmGroupActionById(Long id)
    {
        return alarmGroupActionMapper.deleteAlarmGroupActionById(id);
    }
}
