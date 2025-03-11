package com.boviet.alarm.service;

import java.util.List;
import com.boviet.alarm.domain.AlarmConfig;

/**
 * Alarm ConfigService接口
 * 
 * @author boviet
 * @date 2025-03-08
 */
public interface IAlarmConfigService 
{
    /**
     * 查询Alarm Config
     * 
     * @param id Alarm Config主键
     * @return Alarm Config
     */
    public AlarmConfig selectAlarmConfigById(Long id);

    /**
     * 查询Alarm Config
     * 
     * @param id Alarm Config主键
     * @return Alarm Config
     */
    public AlarmConfig selectAlarmConfigByConfigType(String configType);

    /**
     * 查询Alarm Config列表
     * 
     * @param alarmConfig Alarm Config
     * @return Alarm Config集合
     */
    public List<AlarmConfig> selectAlarmConfigList(AlarmConfig alarmConfig);

    /**
     * 新增Alarm Config
     * 
     * @param alarmConfig Alarm Config
     * @return 结果
     */
    public int insertAlarmConfig(AlarmConfig alarmConfig);

    /**
     * 修改Alarm Config
     * 
     * @param alarmConfig Alarm Config
     * @return 结果
     */
    public int updateAlarmConfig(AlarmConfig alarmConfig);

    /**
     * 批量删除Alarm Config
     * 
     * @param ids 需要删除的Alarm Config主键集合
     * @return 结果
     */
    public int deleteAlarmConfigByIds(Long[] ids);

    /**
     * 删除Alarm Config信息
     * 
     * @param id Alarm Config主键
     * @return 结果
     */
    public int deleteAlarmConfigById(Long id);
}
