package com.boviet.alarm.service;

import java.util.List;

import com.boviet.alarm.domain.AlarmMain;

/**
 * Alarm MainService接口
 * 
 * @author boviet
 * @date 2025-02-25
 */
public interface IAlarmMainService 
{
    /**
     * 查询Alarm Main
     * 
     * @param id Alarm Main主键
     * @return Alarm Main
     */
    public AlarmMain selectAlarmMainById(Long id);

    public AlarmMain selectAlarmMainByAlarmId(String id);

    /**
     * 查询Alarm Main列表
     * 
     * @param alarmMain Alarm Main
     * @return Alarm Main集合
     */
    public List<AlarmMain> selectAlarmMainList(AlarmMain alarmMain);

    /**
     * 新增Alarm Main
     * 
     * @param alarmMain Alarm Main
     * @return 结果
     */
    public int insertAlarmMain(AlarmMain alarmMain);

    /**
     * 修改Alarm Main
     * 
     * @param alarmMain Alarm Main
     * @return 结果
     */
    public int updateAlarmMain(AlarmMain alarmMain);

    /**
     * 批量删除Alarm Main
     * 
     * @param ids 需要删除的Alarm Main主键集合
     * @return 结果
     */
    public int deleteAlarmMainByIds(Long[] ids);

    /**
     * 删除Alarm Main信息
     * 
     * @param id Alarm Main主键
     * @return 结果
     */
    public int deleteAlarmMainById(Long id);
}
