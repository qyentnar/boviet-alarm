package com.boviet.alarm.service;

import java.util.List;
import com.boviet.alarm.domain.AlarmActionTemplate;

/**
 * Alarm Action TemplateService接口
 * 
 * @author boviet
 * @date 2025-03-10
 */
public interface IAlarmActionTemplateService 
{
    /**
     * 查询Alarm Action Template
     * 
     * @param id Alarm Action Template主键
     * @return Alarm Action Template
     */
    public AlarmActionTemplate selectAlarmActionTemplateById(Long id);

    /**
     * 查询Alarm Action Template列表
     * 
     * @param alarmActionTemplate Alarm Action Template
     * @return Alarm Action Template集合
     */
    public List<AlarmActionTemplate> selectAlarmActionTemplateList(AlarmActionTemplate alarmActionTemplate);

    /**
     * 新增Alarm Action Template
     * 
     * @param alarmActionTemplate Alarm Action Template
     * @return 结果
     */
    public int insertAlarmActionTemplate(AlarmActionTemplate alarmActionTemplate);

    /**
     * 修改Alarm Action Template
     * 
     * @param alarmActionTemplate Alarm Action Template
     * @return 结果
     */
    public int updateAlarmActionTemplate(AlarmActionTemplate alarmActionTemplate);

    /**
     * 批量删除Alarm Action Template
     * 
     * @param ids 需要删除的Alarm Action Template主键集合
     * @return 结果
     */
    public int deleteAlarmActionTemplateByIds(Long[] ids);

    /**
     * 删除Alarm Action Template信息
     * 
     * @param id Alarm Action Template主键
     * @return 结果
     */
    public int deleteAlarmActionTemplateById(Long id);
}
