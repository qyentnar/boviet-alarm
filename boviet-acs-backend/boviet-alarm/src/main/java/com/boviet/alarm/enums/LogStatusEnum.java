package com.boviet.alarm.enums;

public enum LogStatusEnum {
  SUCCESS("0", "SUCCESS"),
  ERROR("1", "ERROR");

  private final String code;
  private final String info;

  LogStatusEnum(String code, String info)
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
