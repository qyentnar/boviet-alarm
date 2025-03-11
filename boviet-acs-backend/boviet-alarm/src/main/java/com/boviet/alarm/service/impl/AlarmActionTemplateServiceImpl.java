package com.boviet.alarm.service.impl;

import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmActionTemplateMapper;
import com.boviet.alarm.domain.AlarmActionTemplate;
import com.boviet.alarm.service.IAlarmActionTemplateService;

/**
 * Alarm Action TemplateService业务层处理
 * 
 * @author boviet
 * @date 2025-03-10
 */
@Service
public class AlarmActionTemplateServiceImpl implements IAlarmActionTemplateService 
{
    @Autowired
    private AlarmActionTemplateMapper alarmActionTemplateMapper;

    /**
     * 查询Alarm Action Template
     * 
     * @param id Alarm Action Template主键
     * @return Alarm Action Template
     */
    @Override
    public AlarmActionTemplate selectAlarmActionTemplateById(Long id)
    {
        return alarmActionTemplateMapper.selectAlarmActionTemplateById(id);
    }

    /**
     * 查询Alarm Action Template列表
     * 
     * @param alarmActionTemplate Alarm Action Template
     * @return Alarm Action Template
     */
    @Override
    public List<AlarmActionTemplate> selectAlarmActionTemplateList(AlarmActionTemplate alarmActionTemplate)
    {
        return alarmActionTemplateMapper.selectAlarmActionTemplateList(alarmActionTemplate);
    }

    /**
     * 新增Alarm Action Template
     * 
     * @param alarmActionTemplate Alarm Action Template
     * @return 结果
     */
    @Override
    public int insertAlarmActionTemplate(AlarmActionTemplate alarmActionTemplate)
    {
        alarmActionTemplate.setCreateTime(DateUtils.getNowDate());
        return alarmActionTemplateMapper.insertAlarmActionTemplate(alarmActionTemplate);
    }

    /**
     * 修改Alarm Action Template
     * 
     * @param alarmActionTemplate Alarm Action Template
     * @return 结果
     */
    @Override
    public int updateAlarmActionTemplate(AlarmActionTemplate alarmActionTemplate)
    {
        alarmActionTemplate.setUpdateTime(DateUtils.getNowDate());
        return alarmActionTemplateMapper.updateAlarmActionTemplate(alarmActionTemplate);
    }

    /**
     * 批量删除Alarm Action Template
     * 
     * @param ids 需要删除的Alarm Action Template主键
     * @return 结果
     */
    @Override
    public int deleteAlarmActionTemplateByIds(Long[] ids)
    {
        return alarmActionTemplateMapper.deleteAlarmActionTemplateByIds(ids);
    }

    /**
     * 删除Alarm Action Template信息
     * 
     * @param id Alarm Action Template主键
     * @return 结果
     */
    @Override
    public int deleteAlarmActionTemplateById(Long id)
    {
        return alarmActionTemplateMapper.deleteAlarmActionTemplateById(id);
    }
}
