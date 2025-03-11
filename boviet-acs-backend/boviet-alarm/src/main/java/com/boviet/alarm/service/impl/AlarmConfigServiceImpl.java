package com.boviet.alarm.service.impl;

import java.util.List;

import com.boviet.common.utils.AESUtils;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.uuid.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.alarm.mapper.AlarmConfigMapper;
import com.alibaba.fastjson2.JSONObject;
import com.boviet.alarm.domain.AlarmConfig;
import com.boviet.alarm.service.IAlarmConfigService;

/**
 * Alarm ConfigService业务层处理
 * 
 * @author boviet
 * @date 2025-03-08
 */
@Service
public class AlarmConfigServiceImpl implements IAlarmConfigService 
{
    @Autowired
    private AlarmConfigMapper alarmConfigMapper;

    /**
     * 查询Alarm Config
     * 
     * @param id Alarm Config主键
     * @return Alarm Config
     */
    @Override
    public AlarmConfig selectAlarmConfigById(Long id)
    {
        return alarmConfigMapper.selectAlarmConfigById(id);
    }

    /**
     * 查询Alarm Config
     * 
     * @param id Alarm Config主键
     * @return Alarm Config
     */
    @Override
    public AlarmConfig selectAlarmConfigByConfigType(String configType)
    {
        return alarmConfigMapper.selectAlarmConfigByConfigType(configType);
    }

    /**
     * 查询Alarm Config列表
     * 
     * @param alarmConfig Alarm Config
     * @return Alarm Config
     */
    @Override
    public List<AlarmConfig> selectAlarmConfigList(AlarmConfig alarmConfig)
    {
        return alarmConfigMapper.selectAlarmConfigList(alarmConfig);
    }

    /**
     * 新增Alarm Config
     * 
     * @param alarmConfig Alarm Config
     * @return 结果
     */
    @Override
    public int insertAlarmConfig(AlarmConfig alarmConfig)
    {
        alarmConfig.setCreateTime(DateUtils.getNowDate());
        return alarmConfigMapper.insertAlarmConfig(alarmConfig);
    }

    /**
     * 修改Alarm Config
     * 
     * @param alarmConfig Alarm Config
     * @return 结果
     */
    @Override
    public int updateAlarmConfig(AlarmConfig alarmConfig)
    {
        AlarmConfig _alarmConfig = alarmConfigMapper.selectAlarmConfigByConfigType(alarmConfig.getConfigType());
        if(StringUtils.contains(alarmConfig.getConfigType(), "EMAIL")){
            JSONObject config = JSONObject.parseObject(alarmConfig.getConfig());
            if (config.containsKey("Password")) {
                String password = config.getString("Password");
                String encryptedPassword = StringUtils.isEmpty(AESUtils.decrypt(password)) ? AESUtils.encrypt(password) : password;
                config.remove("Password");
                config.put("Password", encryptedPassword);
            }
            alarmConfig.setConfig(config.toJSONString());
        }  
        if(StringUtils.isNull(_alarmConfig)){
            _alarmConfig = new AlarmConfig();
            _alarmConfig.setConfigId(UUID.randomUUID().toString());
            _alarmConfig.setConfigType(alarmConfig.getConfigType());
            _alarmConfig.setConfigName(alarmConfig.getConfigName());
            _alarmConfig.setConfig(alarmConfig.getConfig());
            _alarmConfig.setCreateBy(alarmConfig.getCreateBy());
            _alarmConfig.setCreateTime(DateUtils.getNowDate());
            alarmConfigMapper.insertAlarmConfig(_alarmConfig);
        }
        alarmConfig.setUpdateTime(DateUtils.getNowDate());
        return alarmConfigMapper.updateAlarmConfig(alarmConfig);
    }

    /**
     * 批量删除Alarm Config
     * 
     * @param ids 需要删除的Alarm Config主键
     * @return 结果
     */
    @Override
    public int deleteAlarmConfigByIds(Long[] ids)
    {
        return alarmConfigMapper.deleteAlarmConfigByIds(ids);
    }

    /**
     * 删除Alarm Config信息
     * 
     * @param id Alarm Config主键
     * @return 结果
     */
    @Override
    public int deleteAlarmConfigById(Long id)
    {
        return alarmConfigMapper.deleteAlarmConfigById(id);
    }
}
