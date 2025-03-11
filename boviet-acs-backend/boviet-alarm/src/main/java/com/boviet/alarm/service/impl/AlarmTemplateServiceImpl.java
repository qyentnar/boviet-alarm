package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.uuid.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmTemplateMapper;
import com.boviet.alarm.domain.AlarmTemplate;
import com.boviet.alarm.service.IAlarmTemplateService;

/**
 * Alarm TemplateService业务层处理
 * 
 * @author boviet
 * @date 2025-03-08
 */
@Service
public class AlarmTemplateServiceImpl implements IAlarmTemplateService 
{
    @Autowired
    private AlarmTemplateMapper alarmTemplateMapper;

    /**
     * 查询Alarm Template
     * 
     * @param id Alarm Template主键
     * @return Alarm Template
     */
    @Override
    public AlarmTemplate selectAlarmTemplateById(Long id)
    {
        return alarmTemplateMapper.selectAlarmTemplateById(id);
    }

    /**
     * 查询Alarm Template列表
     * 
     * @param alarmTemplate Alarm Template
     * @return Alarm Template
     */
    @Override
    public List<AlarmTemplate> selectAlarmTemplateList(AlarmTemplate alarmTemplate)
    {
        return alarmTemplateMapper.selectAlarmTemplateList(alarmTemplate);
    }

    /**
     * 新增Alarm Template
     * 
     * @param alarmTemplate Alarm Template
     * @return 结果
     */
    @Override
    public int insertAlarmTemplate(AlarmTemplate alarmTemplate)
    {
        alarmTemplate.setCreateTime(DateUtils.getNowDate());
        alarmTemplate.setTemplateId(UUID.randomUUID().toString());
        return alarmTemplateMapper.insertAlarmTemplate(alarmTemplate);
    }

    /**
     * 修改Alarm Template
     * 
     * @param alarmTemplate Alarm Template
     * @return 结果
     */
    @Override
    public int updateAlarmTemplate(AlarmTemplate alarmTemplate)
    {
        alarmTemplate.setUpdateTime(DateUtils.getNowDate());
        return alarmTemplateMapper.updateAlarmTemplate(alarmTemplate);
    }

    /**
     * 批量删除Alarm Template
     * 
     * @param ids 需要删除的Alarm Template主键
     * @return 结果
     */
    @Override
    public int deleteAlarmTemplateByIds(Long[] ids)
    {
        return alarmTemplateMapper.deleteAlarmTemplateByIds(ids);
    }

    /**
     * 删除Alarm Template信息
     * 
     * @param id Alarm Template主键
     * @return 结果
     */
    @Override
    public int deleteAlarmTemplateById(Long id)
    {
        return alarmTemplateMapper.deleteAlarmTemplateById(id);
    }
}
