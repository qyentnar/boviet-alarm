package com.boviet.alarm.domain;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Action对象 alarm_action
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmAction extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Action ID */
    @Excel(name = "Action ID")
    private String actionId;

    /** Action Type */
    @Excel(name = "Action Type")
    private String actionType;

    /** Action Name */
    @Excel(name = "Action Name")
    private String actionName;

    /** Config */
    @Excel(name = "Config")
    private String config;

    /** Template */
    @Excel(name = "Template")
    private String template;
}
