package com.boviet.alarm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.Yaml;

import com.alibaba.fastjson2.JSONObject;
import com.boviet.alarm.domain.AlarmJob;
import com.boviet.alarm.domain.AlarmLog;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.dto.AlarmMessageDto;
import com.boviet.alarm.dto.AlarmRuleDto;
import com.boviet.alarm.enums.LogStatusEnum;
import com.boviet.alarm.enums.LogTypeEnum;
import com.boviet.alarm.mapper.AlarmJobMapper;
import com.boviet.alarm.mapper.AlarmLogMapper;
import com.boviet.alarm.mapper.AlarmMainMapper;
import com.boviet.alarm.service.IAlarmManagerService;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.uuid.UUID;

@Service
public class AlarmManagerServiceImpl implements IAlarmManagerService {

    @Autowired
    private AlarmMainMapper alarmMainMapper;

    @Autowired
    private AlarmJobMapper alarmJobMapper;

    @Autowired
    private AlarmLogMapper alarmLogMapper;

    @Override
    @SuppressWarnings("null")
    public String sendMessage(AlarmMessageDto alarmMessage) {
        String result = "Success";
        AlarmLog alarmLog = new AlarmLog();
        alarmLog.setAlarmId(alarmMessage.getAlarmId());
        alarmLog.setLogType(LogTypeEnum.INCOMING.getCode());
        alarmLog.setCreateTime(DateUtils.getNowDate());
        alarmLog.setRequestTime(DateUtils.getNowDate());
        alarmLog.setRequestData(JSONObject.toJSONString(alarmMessage.getAlarmMessage()));
        JSONObject res = new JSONObject();
        try {
            alarmLog = sendMessage(alarmMessage, alarmLog);
            res.put("code", 0);
            res.put("message", result);
            alarmLog.setResponseData(res.toJSONString());
            alarmLog.setStatus(LogStatusEnum.SUCCESS.getCode());
        } catch (Exception ex) {
            res.put("code", -1);
            res.put("message", ex.getMessage());
            alarmLog.setResponseData(res.toJSONString());
            alarmLog.setStatus(LogStatusEnum.ERROR.getCode());
            result = ex.getMessage();
        } finally {
            alarmLogMapper.insertAlarmLog(alarmLog);
        }
        return result;
    }

    private AlarmLog sendMessage(AlarmMessageDto alarmMessage, AlarmLog alarmLog) {
        AlarmRuleDto alarmRuleDto = new AlarmRuleDto();
        String uuid = UUID.randomUUID().toString();
        AlarmMain alarmMain = alarmMainMapper.selectAlarmMainByAlarmId(alarmMessage.getAlarmId());
        if (StringUtils.isNull(alarmMain))
            throw new RuntimeException("Failed to send message: Alarm Code not found");
        alarmLog.setSystemName(alarmMain.getSystemName());
        Yaml yaml = new Yaml();
        alarmRuleDto = yaml.loadAs(alarmMain.getRules(), AlarmRuleDto.class);
        Map<String, String> variables = flattenJson(alarmMessage.getAlarmMessage(), "");
        StringBuilder sb = new StringBuilder();
        for (AlarmRuleDto.Rule rule : alarmRuleDto.getRules()) {
            // String expr = rule.getExpr();
            // expr = setVariable(expr, variables);
            // ExpressionParser parser = new SpelExpressionParser();
            // Expression exp = parser.parseExpression(expr);
            // Boolean value = exp.getValue(Boolean.class);
            // boolean result = Boolean.TRUE.equals(value);
            // if (result || StringUtils.isNull(expr)) { // kiểm tra expression: nếu null
            // hoặc true sẽ tạo message
            // sb.append(buildMessage(rule, variables));
            // }
            sb.append(buildMessage(rule, variables));
        }
        String message = sb.toString();
        if (StringUtils.isNotNull(message) && StringUtils.isNotEmpty(message)) {
            AlarmJob job = new AlarmJob();
            job.setAlarmId(alarmMessage.getAlarmId());
            job.setMessage(message);
            job.setCreateTime(DateUtils.getNowDate());
            job.setRemark(uuid);
            job.setSeverity(alarmRuleDto.getLabels().getSeverity());
            alarmJobMapper.insertAlarmJob(job);
        }
        alarmLog.setResponseTime(DateUtils.getNowDate());
        Long timeout = alarmLog.getResponseTime().getTime() - alarmLog.getCreateTime().getTime();
        alarmLog.setTimeOut(timeout);
        alarmLog.setRemark(uuid);
        return alarmLog;
    }

    private String buildMessage(AlarmRuleDto.Rule rule, Map<String, String> variables) {
        StringBuilder sb = new StringBuilder();
        String message = rule.getMessage();
        if (StringUtils.isNull(message)) throw new RuntimeException("Message cannot be null");
        message = setVariable(message, variables);
        sb.append(message);
        sb.append("\n");
        return sb.toString();
    }

    private static String setVariable(String text, Map<String, String> variables) {
        try {
            Pattern pattern = Pattern.compile("\\$\\{(.+?)}");
            Matcher matcher = pattern.matcher(text);
            StringBuffer result = new StringBuffer();
            while (matcher.find()) {
                String key = matcher.group(1);
                String value;
                if (key.contains("[-1].")) {
                    // Handle special case for [-1]
                    String baseKey = key.substring(0, key.indexOf("["));
                    String subKey = key.substring(key.indexOf(".") + 1);
                    value = variables.entrySet().stream()
                            .filter(e -> e.getKey().startsWith(baseKey + "[") && e.getKey().endsWith("." + subKey))
                            .map(Map.Entry::getValue)
                            .distinct()
                            .collect(Collectors.joining(","));
                    if (value.isEmpty()) {
                        value = "";
                    }
                } else {
                    value = variables.containsKey(key) ? variables.get(key) : "";
                }
                value = Matcher.quoteReplacement(value);
                matcher.appendReplacement(result, value);
            }
            matcher.appendTail(result);
            return result.toString();
        } catch (Exception ex) {
            return text;
        }
    }

    @SuppressWarnings("unchecked")
    private static Map<String, String> flattenJson(Map<String, Object> jsonMap, String prefix) {
        Map<String, String> flatMap = new HashMap<>();
    
        for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
            String key = prefix.isEmpty() ? entry.getKey() : prefix + "." + entry.getKey();
    
            if (entry.getValue() instanceof Map) {
                flatMap.putAll(flattenJson((Map<String, Object>) entry.getValue(), key));
            } 
            else if (entry.getValue() instanceof List) {
                List<Object> list = (List<Object>) entry.getValue();
                // Xử lý array
                for (int i = 0; i < list.size(); i++) {
                    Object item = list.get(i);
                    if (item instanceof Map) {
                        Map<String, Object> itemMap = (Map<String, Object>) item;
                        flatMap.putAll(flattenJson(itemMap, key + "[" + i + "]"));
                    } 
                    else if (item instanceof List) {
                        // Xử lý nested array
                        List<Object> nestedList = (List<Object>) item;
                        for (int j = 0; j < nestedList.size(); j++) {
                            Object nestedItem = nestedList.get(j);
                            if (nestedItem instanceof Map) {
                                flatMap.putAll(flattenJson((Map<String, Object>) nestedItem, 
                                    key + "[" + i + "][" + j + "]"));
                            } else {
                                flatMap.put(key + "[" + i + "][" + j + "]", 
                                    String.valueOf(nestedItem));
                            }
                        }
                    } else {
                        flatMap.put(key + "[" + i + "]", String.valueOf(item));
                    }
                }
            } 
            else {
                flatMap.put(key, String.valueOf(entry.getValue()));
            }
        }
        return flatMap;
    }
}
