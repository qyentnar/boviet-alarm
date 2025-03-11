package com.boviet.alarm.domain;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Register对象 alarm_register
 * 
 * @author boviet
 * @date 2025-03-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmRegister extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Register ID */
    @Excel(name = "Register ID")
    private String registerId;

    /** Register Type */
    @Excel(name = "Register Type")
    private String registerType;

    /** Register */
    @Excel(name = "Register")
    private String register;

    /** Action ID */
    @Excel(name = "Action ID")
    private String actionId;
}
