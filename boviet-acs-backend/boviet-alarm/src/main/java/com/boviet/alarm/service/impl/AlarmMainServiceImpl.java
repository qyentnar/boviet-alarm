package com.boviet.alarm.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.uuid.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boviet.alarm.mapper.AlarmMainMapper;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.service.IAlarmMainService;

import lombok.extern.log4j.Log4j2;

/**
 * Alarm MainService业务层处理
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Log4j2
@Service
public class AlarmMainServiceImpl implements IAlarmMainService {
    @Autowired
    private AlarmMainMapper alarmMainMapper;

    /**
     * 查询Alarm Main
     * 
     * @param id Alarm Main主键
     * @return Alarm Main
     */
    @Override
    public AlarmMain selectAlarmMainById(Long id) {
        return alarmMainMapper.selectAlarmMainById(id);
    }

    /**
     * 查询Alarm Main
     * 
     * @param id Alarm Main主键
     * @return Alarm Main
     */
    @Override
    public AlarmMain selectAlarmMainByAlarmId(String id) {
        return alarmMainMapper.selectAlarmMainByAlarmId(id);
    }

    /**
     * 查询Alarm Main列表
     * 
     * @param alarmMain Alarm Main
     * @return Alarm Main
     */
    @Override
    public List<AlarmMain> selectAlarmMainList(AlarmMain alarmMain) {
        return alarmMainMapper.selectAlarmMainList(alarmMain);
    }

    /**
     * 新增Alarm Main
     * 
     * @param alarmMain Alarm Main
     * @return 结果
     */
    @Override
    public int insertAlarmMain(AlarmMain alarmMain) {
        alarmMain.setCreateTime(DateUtils.getNowDate());
        alarmMain.setAlarmId(UUID.randomUUID().toString());
        return alarmMainMapper.insertAlarmMain(alarmMain);
    }

    /**
     * 修改Alarm Main
     * 
     * @param alarmMain Alarm Main
     * @return 结果
     */
    @Override
    public int updateAlarmMain(AlarmMain alarmMain) {
        alarmMain.setUpdateTime(DateUtils.getNowDate());
        return alarmMainMapper.updateAlarmMain(alarmMain);
    }

    /**
     * 批量删除Alarm Main
     * 
     * @param ids 需要删除的Alarm Main主键
     * @return 结果
     */
    @Override
    public int deleteAlarmMainByIds(Long[] ids) {
        return alarmMainMapper.deleteAlarmMainByIds(ids);
    }

    /**
     * 删除Alarm Main信息
     * 
     * @param id Alarm Main主键
     * @return 结果
     */
    @Override
    public int deleteAlarmMainById(Long id) {
        return alarmMainMapper.deleteAlarmMainById(id);
    }
}
