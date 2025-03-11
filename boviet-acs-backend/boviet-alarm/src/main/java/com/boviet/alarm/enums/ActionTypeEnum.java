package com.boviet.alarm.enums;

public enum ActionTypeEnum {
    EMAIL("EMAIL", "EMAIL"),
    DINGDING_GROUP("DINGDING_GROUP", "钉钉"),
    DINGDING_PERSON("DINGDING_PERSON", "钉钉人员"),
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
