package com.boviet.alarm.enums;

public enum LogTypeEnum {
    INCOMING("INCOMING", "INCOMING"),
    OUTGOING("OUTGOING", "OUTGOING");

    private final String code;
    private final String info;

    LogTypeEnum(String code, String info)
    {
        this.code = code;
        this.info = info;
    }

    public String getCode()
    {
        return code;
    }

    public String getInfo()
    {
        return info;
    }
}
