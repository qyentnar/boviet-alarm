package com.boviet.alarm.enums;

public enum JobSeverityEnum {
    CRITICAL(0, "CRITICAL"),
    HIGH(1, "HIGH"), 
    MEDIUM(2, "MEDIUM"), 
    LOW(3,"LOW");

    private final Integer code;
    private final String info;

    JobSeverityEnum(Integer code, String info)
    {
        this.code = code;
        this.info = info;
    }

    public Integer getCode()
    {
        return code;
    }

    public String getInfo()
    {
        return info;
    }
}
