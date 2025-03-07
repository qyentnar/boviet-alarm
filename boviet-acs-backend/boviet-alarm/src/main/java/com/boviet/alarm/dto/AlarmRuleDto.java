package com.boviet.alarm.dto;

import java.util.List;

import lombok.Data;

@Data
public class AlarmRuleDto {
    private List<Rule> rules;
    private Labels labels;

    @Data
    public static class Rule  {
        private String alert;
        private String expression;
        private String duration;
        private String message;
    }

    @Data
    public static class Labels  {
        private Integer severity;
    }
}
