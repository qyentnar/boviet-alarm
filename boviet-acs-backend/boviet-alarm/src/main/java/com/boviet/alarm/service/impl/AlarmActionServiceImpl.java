package com.boviet.alarm.service.impl;

import java.util.List;

import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.uuid.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boviet.alarm.mapper.AlarmActionMapper;
import com.boviet.alarm.mapper.AlarmActionTemplateMapper;
import com.boviet.alarm.mapper.AlarmRegisterMapper;
import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.domain.AlarmActionTemplate;
import com.boviet.alarm.domain.AlarmRegister;
import com.boviet.alarm.service.IAlarmActionService;

/**
 * Alarm ActionAction业务层处理
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Service
public class AlarmActionServiceImpl implements IAlarmActionService {
    @Autowired
    private AlarmActionMapper alarmActionMapper;

    @Autowired
    private AlarmActionTemplateMapper alarmActionTemplateMapper;

    @Autowired
    private AlarmRegisterMapper alarmRegisterMapper;

    /**
     * 查询Alarm Action
     * 
     * @param id Alarm Action主键
     * @return Alarm Action
     */
    @Override
    public AlarmAction selectAlarmActionById(Long id) {
        return alarmActionMapper.selectAlarmActionById(id);
    }

    /**
     * 查询Alarm Action列表
     * 
     * @param alarmAction Alarm Action
     * @return Alarm Action
     */
    @Override
    public List<AlarmAction> selectAlarmActionList(AlarmAction alarmAction) {
        return alarmActionMapper.selectAlarmActionList(alarmAction);
    }

    /**
     * 新增Alarm Action
     * 
     * @param alarmAction Alarm Action
     * @return 结果
     */
    @Override
    public int insertAlarmAction(AlarmAction alarmAction) {
        alarmAction.setCreateTime(DateUtils.getNowDate());
        alarmAction.setActionId(UUID.randomUUID().toString());
        int row = alarmActionMapper.insertAlarmAction(alarmAction);
        if (row > 0) {
            alarmActionTemplateMapper.deleteAlarmActionTemplateByActionId(alarmAction.getActionId());
            for (String templateId : alarmAction.getTemplateIds()) {
                AlarmActionTemplate alarmActionTemplate = new AlarmActionTemplate();
                alarmActionTemplate.setActionId(alarmAction.getActionId());
                alarmActionTemplate.setTemplateId(templateId);
                alarmActionTemplateMapper.insertAlarmActionTemplate(alarmActionTemplate);
            }
        }
        return row;
    }

    /**
     * 修改Alarm Action
     * 
     * @param alarmAction Alarm Action
     * @return 结果
     */
    @Override
    public int updateAlarmAction(AlarmAction alarmAction) {
        alarmAction.setUpdateTime(DateUtils.getNowDate());
        int row = alarmActionMapper.updateAlarmAction(alarmAction);
        if(row > 0){
            alarmActionTemplateMapper.deleteAlarmActionTemplateByActionId(alarmAction.getActionId());
            for (String templateId : alarmAction.getTemplateIds()) {
                AlarmActionTemplate alarmActionTemplate = new AlarmActionTemplate();
                alarmActionTemplate.setActionId(alarmAction.getActionId());
                alarmActionTemplate.setTemplateId(templateId);
                alarmActionTemplateMapper.insertAlarmActionTemplate(alarmActionTemplate);
            }
        }
        return row;
    }

    /**
     * 批量删除Alarm Action
     * 
     * @param ids 需要删除的Alarm Action主键
     * @return 结果
     */
    @Override
    public int deleteAlarmActionByIds(Long[] ids) {
        return alarmActionMapper.deleteAlarmActionByIds(ids);
    }

    /**
     * 删除Alarm Action信息
     * 
     * @param id Alarm Action主键
     * @return 结果
     */
    @Override
    public int deleteAlarmActionById(Long id) {
        return alarmActionMapper.deleteAlarmActionById(id);
    }

    @Override
    public int  updateAlarmRegister(AlarmAction alarmAction){
        int row = 0;
        List<AlarmRegister> alarmRegisters = alarmAction.getRegisters();
        if(StringUtils.isNotNull(alarmRegisters)){
            alarmRegisterMapper.deleteAlarmRegisterByActionId(alarmAction.getActionId());
            for (AlarmRegister alarmRegister : alarmRegisters) {
                alarmRegister.setRegisterId(UUID.randomUUID().toString());
                alarmRegister.setActionId(alarmAction.getActionId());
                alarmRegister.setCreateBy(alarmAction.getCreateBy());
                alarmRegister.setCreateTime(DateUtils.getNowDate());
                row += alarmRegisterMapper.insertAlarmRegister(alarmRegister);
            }
        }
        return row;
    }
}
