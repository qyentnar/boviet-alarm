package com.boviet.alarm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

/**
 * Alarm Relation对象 alarm_relation
 * 
 * @author boviet
 * @date 2025-02-26
 */
public class AlarmGroupAction extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Group ID */
    @Excel(name = "Group ID")
    private String groupId;

    /** Action ID */
    @Excel(name = "Action ID")
    private String actionId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setGroupId(String groupId) 
    {
        this.groupId = groupId;
    }

    public String getGroupId() 
    {
        return groupId;
    }
    public void setActionId(String actionId) 
    {
        this.actionId = actionId;
    }

    public String getActionId() 
    {
        return actionId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("groupId", getGroupId())
            .append("actionId", getActionId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
