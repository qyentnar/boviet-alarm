package com.boviet.alarm.mapper;

import java.util.List;
import com.boviet.alarm.domain.AlarmTemplate;

/**
 * Alarm TemplateMapper接口
 * 
 * @author boviet
 * @date 2025-03-08
 */
public interface AlarmTemplateMapper 
{
    /**
     * 查询Alarm Template
     * 
     * @param id Alarm Template主键
     * @return Alarm Template
     */
    public AlarmTemplate selectAlarmTemplateById(Long id);

    /**
     * 
     * @param actionId
     * @return
     */
    public List<AlarmTemplate> selectAlarmTemplateByActionId(String actionId);

    /**
     * 查询Alarm Template
     * 
     * @param id Alarm Template主键
     * @return Alarm Template
     */
    public List<AlarmTemplate> selectAlarmTemplateByTemplateType(String templateType);

    /**
     * 查询Alarm Template列表
     * 
     * @param alarmTemplate Alarm Template
     * @return Alarm Template集合
     */
    public List<AlarmTemplate> selectAlarmTemplateList(AlarmTemplate alarmTemplate);

    /**
     * 新增Alarm Template
     * 
     * @param alarmTemplate Alarm Template
     * @return 结果
     */
    public int insertAlarmTemplate(AlarmTemplate alarmTemplate);

    /**
     * 修改Alarm Template
     * 
     * @param alarmTemplate Alarm Template
     * @return 结果
     */
    public int updateAlarmTemplate(AlarmTemplate alarmTemplate);

    /**
     * 删除Alarm Template
     * 
     * @param id Alarm Template主键
     * @return 结果
     */
    public int deleteAlarmTemplateById(Long id);

    /**
     * 批量删除Alarm Template
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAlarmTemplateByIds(Long[] ids);
}
