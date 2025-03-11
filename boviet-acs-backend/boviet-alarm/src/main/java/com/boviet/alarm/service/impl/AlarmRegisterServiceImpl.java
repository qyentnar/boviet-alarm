package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmRegisterMapper;
import com.boviet.alarm.domain.AlarmRegister;
import com.boviet.alarm.service.IAlarmRegisterService;

/**
 * Alarm RegisterService业务层处理
 * 
 * @author boviet
 * @date 2025-03-10
 */
@Service
public class AlarmRegisterServiceImpl implements IAlarmRegisterService 
{
    @Autowired
    private AlarmRegisterMapper alarmRegisterMapper;

    /**
     * 查询Alarm Register
     * 
     * @param id Alarm Register主键
     * @return Alarm Register
     */
    @Override
    public AlarmRegister selectAlarmRegisterById(Long id)
    {
        return alarmRegisterMapper.selectAlarmRegisterById(id);
    }

    /**
     * 查询Alarm Register列表
     * 
     * @param alarmRegister Alarm Register
     * @return Alarm Register
     */
    @Override
    public List<AlarmRegister> selectAlarmRegisterList(AlarmRegister alarmRegister)
    {
        return alarmRegisterMapper.selectAlarmRegisterList(alarmRegister);
    }

    @Override
    public List<AlarmRegister> selectAlarmRegisterListByActionId(String actionId)
    {
        return alarmRegisterMapper.selectAlarmRegisterListByActionId(actionId);
    }

    /**
     * 新增Alarm Register
     * 
     * @param alarmRegister Alarm Register
     * @return 结果
     */
    @Override
    public int insertAlarmRegister(AlarmRegister alarmRegister)
    {
        alarmRegister.setCreateTime(DateUtils.getNowDate());
        return alarmRegisterMapper.insertAlarmRegister(alarmRegister);
    }

    /**
     * 修改Alarm Register
     * 
     * @param alarmRegister Alarm Register
     * @return 结果
     */
    @Override
    public int updateAlarmRegister(AlarmRegister alarmRegister)
    {
        alarmRegister.setUpdateTime(DateUtils.getNowDate());
        return alarmRegisterMapper.updateAlarmRegister(alarmRegister);
    }

    /**
     * 批量删除Alarm Register
     * 
     * @param ids 需要删除的Alarm Register主键
     * @return 结果
     */
    @Override
    public int deleteAlarmRegisterByIds(Long[] ids)
    {
        return alarmRegisterMapper.deleteAlarmRegisterByIds(ids);
    }

    /**
     * 删除Alarm Register信息
     * 
     * @param id Alarm Register主键
     * @return 结果
     */
    @Override
    public int deleteAlarmRegisterById(Long id)
    {
        return alarmRegisterMapper.deleteAlarmRegisterById(id);
    }
}
