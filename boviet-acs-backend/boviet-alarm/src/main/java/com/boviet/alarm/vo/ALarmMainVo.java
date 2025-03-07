package com.boviet.alarm.vo;

import java.util.List;

import com.boviet.common.annotation.Excel;

import lombok.Data;

@Data
public class ALarmMainVo {

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

    private String rulesPath;

    private List<AlarmGroupVo> alarmGroups;
}
