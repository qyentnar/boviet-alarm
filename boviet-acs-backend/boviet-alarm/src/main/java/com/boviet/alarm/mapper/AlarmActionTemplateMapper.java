package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmActionTemplate;

/**
 * Alarm Action TemplateMapper接口
 * 
 * @author boviet
 * @date 2025-03-10
 */
public interface AlarmActionTemplateMapper 
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
     * 删除Alarm Action Template
     * 
     * @param id Alarm Action Template主键
     * @return 结果
     */
    public int deleteAlarmActionTemplateById(Long id);

    /**
     * 删除Alarm Action Template
     * 
     * @param id Alarm Action Template主键
     * @return 结果
     */
    public int deleteAlarmActionTemplateByActionId(String actionId);

    /**
     * 批量删除Alarm Action Template
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmActionTemplateByIds(Long[] ids);
}
