package com.boviet.alarm.domain;

import java.util.Date;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Log对象 alarm_log
 * 
 * @author boviet
 * @date 2025-03-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Log Type */
    @Excel(name = "Log Type")
    private String logType;

    /** Alarm ID */
    @Excel(name = "Alarm ID")
    private String alarmId;

    /** System Name */
    @Excel(name = "System Name")
    private String systemName;

    /** Request Data */
    @Excel(name = "Request Data")
    private String requestData;

    /** Response Data */
    @Excel(name = "Response Data")
    private String responseData;

    /** Status */
    @Excel(name = "Status")
    private String status;

    /** Time Out */
    @Excel(name = "Time Out")
    private Long timeOut;

    /** Request Time */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "Request Time", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date requestTime;
    
    /** Response Time */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date responseTime;
}
