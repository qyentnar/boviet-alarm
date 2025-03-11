package com.boviet.alarm.service;

import java.util.List;
import com.boviet.alarm.domain.AlarmRegister;

/**
 * Alarm RegisterService接口
 * 
 * @author boviet
 * @date 2025-03-10
 */
public interface IAlarmRegisterService 
{
    /**
     * 查询Alarm Register
     * 
     * @param id Alarm Register主键
     * @return Alarm Register
     */
    public AlarmRegister selectAlarmRegisterById(Long id);

    /**
     * 查询Alarm Register列表
     * 
     * @param alarmRegister Alarm Register
     * @return Alarm Register集合
     */
    public List<AlarmRegister> selectAlarmRegisterList(AlarmRegister alarmRegister);

    /**
     * 查询Alarm Register列表
     * 
     * @param alarmRegister Alarm Register
     * @return Alarm Register集合
     */
    public List<AlarmRegister> selectAlarmRegisterListByActionId(String actionId);

    /**
     * 新增Alarm Register
     * 
     * @param alarmRegister Alarm Register
     * @return 结果
     */
    public int insertAlarmRegister(AlarmRegister alarmRegister);

    /**
     * 修改Alarm Register
     * 
     * @param alarmRegister Alarm Register
     * @return 结果
     */
    public int updateAlarmRegister(AlarmRegister alarmRegister);

    /**
     * 批量删除Alarm Register
     * 
     * @param ids 需要删除的Alarm Register主键集合
     * @return 结果
     */
    public int deleteAlarmRegisterByIds(Long[] ids);

    /**
     * 删除Alarm Register信息
     * 
     * @param id Alarm Register主键
     * @return 结果
     */
    public int deleteAlarmRegisterById(Long id);
}
