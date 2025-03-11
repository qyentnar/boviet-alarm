package com.boviet.alarm.domain;

import java.util.List;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Main对象 alarm_main
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmMain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Alarm ID */
    @Excel(name = "Alarm ID")
    private String alarmId;

    /** System Name */
    @Excel(name = "System Name")
    private String systemName;

    /** Module 1 */
    @Excel(name = "Module 1")
    private String module1;

    /** Module 2 */
    @Excel(name = "Module 2")
    private String module2;

    /** Module 3 */
    @Excel(name = "Module 3")
    private String module3;

    /** Module 4 */
    @Excel(name = "Module 4")
    private String module4;

    /** Status */
    @Excel(name = "Status")
    private Integer status;

    /**  */
    @Excel(name = "Rules")
    private String rules;
}
