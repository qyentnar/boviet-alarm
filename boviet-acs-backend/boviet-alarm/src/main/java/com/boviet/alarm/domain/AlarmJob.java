package com.boviet.alarm.domain;

import java.util.Date;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Job对象 alarm_job
 * 
 * @author boviet
 * @date 2025-03-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmJob extends BaseEntity
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

    /** Message */
    @Excel(name = "Message")
    private String message;

    /** Status */
    @Excel(name = "Status")
    private String status;

    /** Severity */
    @Excel(name = "Severity")
    private Integer severity;

    /** Time Out */
    @Excel(name = "Time Out")
    private Long timeOut;
}
