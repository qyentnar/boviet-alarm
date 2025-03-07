package com.boviet.alarm.enums;

public enum JobStatusEnum {
  WAIT("1", "WAIT"),
  SENT("0", "SENT"),
  FAIL("-1","FAIL");

  private final String code;
  private final String info;

  JobStatusEnum(String code, String info)
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
