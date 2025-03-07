package com.boviet.alarm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

/**
 * Alarm Main Group对象 alarm_main_group
 * 
 * @author boviet
 * @date 2025-02-28
 */
public class AlarmMainGroup extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Alarm ID */
    @Excel(name = "Alarm ID")
    private String alarmId;

    /** Group ID */
    @Excel(name = "Group ID")
    private String groupId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAlarmId(String alarmId) 
    {
        this.alarmId = alarmId;
    }

    public String getAlarmId() 
    {
        return alarmId;
    }
    public void setGroupId(String groupId) 
    {
        this.groupId = groupId;
    }

    public String getGroupId() 
    {
        return groupId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("alarmId", getAlarmId())
            .append("groupId", getGroupId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
