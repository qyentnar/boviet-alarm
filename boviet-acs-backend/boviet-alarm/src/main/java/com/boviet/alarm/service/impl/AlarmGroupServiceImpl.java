package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.bean.BeanUtils;
import com.boviet.common.utils.uuid.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmGroupMapper;
import com.boviet.alarm.service.IAlarmGroupService;
import com.boviet.alarm.mapper.AlarmGroupActionMapper;
import com.boviet.alarm.domain.AlarmGroup;
import com.boviet.alarm.domain.AlarmGroupAction;
/**
 * Alarm GroupAction业务层处理
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Service
public class AlarmGroupServiceImpl implements IAlarmGroupService
{
    @Autowired
    private AlarmGroupMapper alarmGroupMapper;

    @Autowired
    private AlarmGroupActionMapper alarmGroupActionMapper;

    /**
     * 查询Alarm Group
     * 
     * @param id Alarm Group主键
     * @return Alarm Group
     */
    @Override
    public AlarmGroup selectAlarmGroupById(Long id)
    {
        return alarmGroupMapper.selectAlarmGroupById(id);
    }

    @Override
    public AlarmGroup selectAlarmGroupByGroupId(String groupId){
        return alarmGroupMapper.selectAlarmGroupByGroupId(groupId);
    }
    /**
     * 查询Alarm Group列表
     * 
     * @param alarmGroup Alarm Group
     * @return Alarm Group
     */
    @Override
    public List<AlarmGroup> selectAlarmGroupList(AlarmGroup alarmGroup)
    {
        return alarmGroupMapper.selectAlarmGroupList(alarmGroup);
    }

    /**
     * 新增Alarm Group
     * 
     * @param alarmGroup Alarm Group
     * @return 结果
     */
    @Override
    public int insertAlarmGroup(AlarmGroup alarmGroup)
    {
        AlarmGroup _alarmGroup = alarmGroupMapper.selectAlarmGroupByGroupName(alarmGroup.getGroupName());
        if(StringUtils.isNotNull(_alarmGroup)) throw new RuntimeException("Group already exists");
        alarmGroup.setCreateTime(DateUtils.getNowDate());
        alarmGroup.setGroupId(UUID.randomUUID().toString());
        for (String actionId : alarmGroup.getActionIds()) {
            AlarmGroupAction alarmGroupAction = new AlarmGroupAction();
            alarmGroupAction.setGroupId(alarmGroup.getGroupId());
            alarmGroupAction.setActionId(actionId);
            alarmGroupAction.setCreateBy(alarmGroup.getCreateBy());
            alarmGroupAction.setCreateTime(DateUtils.getNowDate());
            alarmGroupActionMapper.insertAlarmGroupAction(alarmGroupAction);
        }
        return alarmGroupMapper.insertAlarmGroup(alarmGroup);
    }

    /**
     * 修改Alarm Group
     * 
     * @param alarmGroup Alarm Group
     * @return 结果
     */
    @Override
    public int updateAlarmGroup(AlarmGroup alarmGroup)
    {
        alarmGroupActionMapper.deleteAlarmGroupActionByGroupId(alarmGroup.getGroupId());
        for (String actionId : alarmGroup.getActionIds()) {
            AlarmGroupAction alarmGroupAction = new AlarmGroupAction();
            alarmGroupAction.setGroupId(alarmGroup.getGroupId());
            alarmGroupAction.setActionId(actionId);
            alarmGroupAction.setCreateBy(alarmGroup.getCreateBy());
            alarmGroupAction.setCreateTime(DateUtils.getNowDate());
            alarmGroupActionMapper.insertAlarmGroupAction(alarmGroupAction);
        }
        alarmGroup.setUpdateTime(DateUtils.getNowDate());
        return alarmGroupMapper.updateAlarmGroup(alarmGroup);
    }

    /**
     * 批量删除Alarm Group
     * 
     * @param ids 需要删除的Alarm Group主键
     * @return 结果
     */
    @Override
    public int deleteAlarmGroupByIds(Long[] ids)
    {
        return alarmGroupMapper.deleteAlarmGroupByIds(ids);
    }

    /**
     * 删除Alarm Group信息
     * 
     * @param id Alarm Group主键
     * @return 结果
     */
    @Override
    public int deleteAlarmGroupById(Long id)
    {
        return alarmGroupMapper.deleteAlarmGroupById(id);
    }
}
