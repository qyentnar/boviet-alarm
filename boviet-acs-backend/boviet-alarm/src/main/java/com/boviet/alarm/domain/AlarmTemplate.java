package com.boviet.alarm.domain;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Template对象 alarm_template
 * 
 * @author boviet
 * @date 2025-03-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Template ID */
    @Excel(name = "Template ID")
    private String templateId;

    /** Template Name */
    @Excel(name = "Template Name")
    private String templateName;

    /** Template Type */
    @Excel(name = "Template Type")
    private String templateType;

    /** Template */
    @Excel(name = "Template")
    private String template;

}
