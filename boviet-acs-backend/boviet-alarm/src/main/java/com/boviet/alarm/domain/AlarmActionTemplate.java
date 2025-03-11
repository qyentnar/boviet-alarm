package com.boviet.alarm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

/**
 * Alarm Action Template对象 alarm_action_template
 * 
 * @author boviet
 * @date 2025-03-10
 */
public class AlarmActionTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Action ID */
    @Excel(name = "Action ID")
    private String actionId;

    /** Template ID */
    @Excel(name = "Template ID")
    private String templateId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setActionId(String actionId) 
    {
        this.actionId = actionId;
    }

    public String getActionId() 
    {
        return actionId;
    }
    public void setTemplateId(String templateId) 
    {
        this.templateId = templateId;
    }

    public String getTemplateId() 
    {
        return templateId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("actionId", getActionId())
            .append("templateId", getTemplateId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
