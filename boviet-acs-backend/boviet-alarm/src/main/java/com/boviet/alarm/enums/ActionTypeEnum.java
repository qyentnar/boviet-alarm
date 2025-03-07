package com.boviet.alarm.enums;

public enum ActionTypeEnum {
    EMAIL("EMAIL", "EMAIL"),
    DINGDING("DINGDING", "钉钉"),
    ITSM("ITSM", "ITSM"),
    WATCHER("WATCHER", "WATCHER");

    private final String code;
    private final String info;

    ActionTypeEnum(String code, String info)
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
