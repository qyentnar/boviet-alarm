package com.boviet.alarm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

/**
 * Alarm Config对象 alarm_config
 * 
 * @author boviet
 * @date 2025-03-08
 */
public class AlarmConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Config ID */
    @Excel(name = "Config ID")
    private String configId;

    /** Config Type */
    @Excel(name = "Config Type")
    private String configType;

    /** Config Name */
    @Excel(name = "Config Name")
    private String configName;

    /** Config */
    @Excel(name = "Config")
    private String config;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setConfigId(String configId) 
    {
        this.configId = configId;
    }

    public String getConfigId() 
    {
        return configId;
    }
    public void setConfigType(String configType) 
    {
        this.configType = configType;
    }

    public String getConfigType() 
    {
        return configType;
    }
    public void setConfigName(String configName) 
    {
        this.configName = configName;
    }

    public String getConfigName() 
    {
        return configName;
    }
    public void setConfig(String config) 
    {
        this.config = config;
    }

    public String getConfig() 
    {
        return config;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("configId", getConfigId())
            .append("configType", getConfigType())
            .append("configName", getConfigName())
            .append("config", getConfig())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
