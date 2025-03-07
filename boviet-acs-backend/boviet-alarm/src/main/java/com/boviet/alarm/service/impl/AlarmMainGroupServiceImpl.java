package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmMainGroupMapper;
import com.boviet.alarm.domain.AlarmMainGroup;
import com.boviet.alarm.service.IAlarmMainGroupService;

/**
 * Alarm Main GroupService业务层处理
 * 
 * @author boviet
 * @date 2025-02-28
 */
@Service
public class AlarmMainGroupServiceImpl implements IAlarmMainGroupService 
{
    @Autowired
    private AlarmMainGroupMapper alarmMainGroupMapper;

    /**
     * 查询Alarm Main Group
     * 
     * @param id Alarm Main Group主键
     * @return Alarm Main Group
     */
    @Override
    public AlarmMainGroup selectAlarmMainGroupById(Long id)
    {
        return alarmMainGroupMapper.selectAlarmMainGroupById(id);
    }

    /**
     * 查询Alarm Main Group列表
     * 
     * @param alarmMainGroup Alarm Main Group
     * @return Alarm Main Group
     */
    @Override
    public List<AlarmMainGroup> selectAlarmMainGroupList(AlarmMainGroup alarmMainGroup)
    {
        return alarmMainGroupMapper.selectAlarmMainGroupList(alarmMainGroup);
    }

    /**
     * 新增Alarm Main Group
     * 
     * @param alarmMainGroup Alarm Main Group
     * @return 结果
     */
    @Override
    public int insertAlarmMainGroup(AlarmMainGroup alarmMainGroup)
    {
        alarmMainGroup.setCreateTime(DateUtils.getNowDate());
        return alarmMainGroupMapper.insertAlarmMainGroup(alarmMainGroup);
    }

    /**
     * 修改Alarm Main Group
     * 
     * @param alarmMainGroup Alarm Main Group
     * @return 结果
     */
    @Override
    public int updateAlarmMainGroup(AlarmMainGroup alarmMainGroup)
    {
        alarmMainGroup.setUpdateTime(DateUtils.getNowDate());
        return alarmMainGroupMapper.updateAlarmMainGroup(alarmMainGroup);
    }

    /**
     * 批量删除Alarm Main Group
     * 
     * @param ids 需要删除的Alarm Main Group主键
     * @return 结果
     */
    @Override
    public int deleteAlarmMainGroupByIds(Long[] ids)
    {
        return alarmMainGroupMapper.deleteAlarmMainGroupByIds(ids);
    }

    /**
     * 删除Alarm Main Group信息
     * 
     * @param id Alarm Main Group主键
     * @return 结果
     */
    @Override
    public int deleteAlarmMainGroupById(Long id)
    {
        return alarmMainGroupMapper.deleteAlarmMainGroupById(id);
    }
}
