package com.boviet.alarm.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.Yaml;

import com.alibaba.fastjson2.JSONObject;
import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.domain.AlarmConfig;
import com.boviet.alarm.domain.AlarmGroup;
import com.boviet.alarm.domain.AlarmJob;
import com.boviet.alarm.domain.AlarmLog;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.domain.AlarmRegister;
import com.boviet.alarm.domain.AlarmTemplate;
import com.boviet.alarm.dto.AlarmMessageDto;
import com.boviet.alarm.enums.ActionTypeEnum;
import com.boviet.alarm.enums.JobStatusEnum;
import com.boviet.alarm.enums.LogStatusEnum;
import com.boviet.alarm.enums.LogTypeEnum;
import com.boviet.alarm.mapper.AlarmConfigMapper;
import com.boviet.alarm.mapper.AlarmGroupMapper;
import com.boviet.alarm.mapper.AlarmJobMapper;
import com.boviet.alarm.mapper.AlarmLogMapper;
import com.boviet.alarm.mapper.AlarmMainMapper;
import com.boviet.alarm.mapper.AlarmRegisterMapper;
import com.boviet.alarm.mapper.AlarmTemplateMapper;
import com.boviet.alarm.service.IAlarmManagerService;
import com.boviet.common.config.EmailConfig;
import com.boviet.common.core.domain.entity.SysDictData;
import com.boviet.common.core.domain.entity.SysUser;
import com.boviet.common.utils.AESUtils;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.http.HttpUtils;
import com.boviet.system.mapper.SysDictDataMapper;
import com.boviet.system.mapper.SysUserMapper;

@Service
public class AlarmManagerServiceImpl implements IAlarmManagerService {

    @Autowired
    private AlarmMainMapper alarmMainMapper;

    @Autowired
    private AlarmJobMapper alarmJobMapper;

    @Autowired
    private AlarmLogMapper alarmLogMapper;

    @Autowired
    private AlarmGroupMapper alarmGroupMapper;

    @Autowired
    private SysDictDataMapper sysDictDataMapper;

    @Autowired
    private AlarmConfigMapper alarmConfigMapper;

    @Autowired
    private AlarmTemplateMapper alarmTemplateMapper;

    @Autowired
    private AlarmRegisterMapper alarmRegisterMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    @SuppressWarnings("null")
    public String createAlarm(AlarmMessageDto alarmMessage) {
        String result = "Success";
        Map<String, Object> log = new HashMap<>();
        log.put("alarm_id", alarmMessage.getAlarmId());
        log.put("log_type", LogTypeEnum.INCOMING.getCode());
        log.put("create_time", DateUtils.dateTimeNow("yyyy-MM-dd HH:mm:ss"));
        log.put("request_time", DateUtils.dateTimeNow("yyyy-MM-dd HH:mm:ss"));
        log.put("request_data", JSONObject.toJSONString(alarmMessage.getAlarmMessage()));

        JSONObject res = new JSONObject();
        try {
            log = createAlarm(alarmMessage, log);
            res.put("code", 0);
            res.put("message", result);
            log.put("response_data", res.toJSONString());
            log.put("status", LogStatusEnum.SUCCESS.getCode());
        } catch (Exception ex) {
            res.put("code", -1);
            res.put("message", ex.getMessage());
            log.put("response_data", res.toJSONString());
            log.put("status", LogStatusEnum.ERROR.getCode());
            result = ex.getMessage();
        } finally {
            this.createLogRecord(log);
        }
        return result;
    }

    private Map<String, Object> createAlarm(AlarmMessageDto alarmMessageDto, Map<String, Object> log) {
        AlarmMain alarmMain = alarmMainMapper.selectAlarmMainByAlarmId(alarmMessageDto.getAlarmId());
        if (StringUtils.isNull(alarmMain))
            throw new RuntimeException("Failed to send message: Alarm Code not found");
        log.put("system_name", alarmMain.getSystemName());
        JSONObject alarmMessage = alarmMessageDto.getAlarmMessage();
        if (StringUtils.isNull(alarmMessage))
            throw new RuntimeException("Failed to send message: Alarm Message is empty");
        alarmMessage.put("shift", this.getShift(alarmMessageDto.getCreateTime()));
        Map<String, String> variables = flattenJson(alarmMessage, "");
        String rules = alarmMain.getRules();
        if (StringUtils.isNull(rules))
            throw new RuntimeException("Failed to send message: Rules is empty");
        String message = setVariable(rules, variables);
        if (StringUtils.isNull(message))
            throw new RuntimeException("Failed to send message: Message is empty");

        // Add the alarm job to the queue
        this.createJob(alarmMessageDto, message);

        // Add the log record
        log.put("response_time", DateUtils.dateTimeNow("yyyy-MM-dd HH:mm:ss"));
        Long timeout = DateUtils.getNowDate().getTime() - DateUtils.parseDate(log.get("request_time")).getTime();
        log.put("time_out", timeout);
        return log;
    }

    private void createJob(AlarmMessageDto alarmMessageDto, String message) {
        Yaml yaml = new Yaml();
        Map<String, Object> data = yaml.load(message);
        AlarmGroup alarmGroup = this.setAlarmGroup(alarmMessageDto, data);
        if (StringUtils.isNull(alarmGroup)) {
            AlarmJob job = new AlarmJob();
            job.setAlarmId(alarmMessageDto.getAlarmId());
            job.setMessage(message);
            job.setCreateTime(DateUtils.getNowDate());
            job.setStatus(JobStatusEnum.FAIL.getCode());
            job.setRemark("No group found for this alarm");
            alarmJobMapper.insertAlarmJob(job);
            return;
        }
        List<AlarmGroup> alarmGroups = alarmGroupMapper.selectAlarmGroupList(alarmGroup);
        for (AlarmGroup group : alarmGroups) {
            AlarmJob job = new AlarmJob();
            job.setAlarmId(alarmMessageDto.getAlarmId());
            job.setMessage(message);
            job.setCreateTime(DateUtils.getNowDate());
            job.setGroupId(group.getGroupId());
            job.setStatus(JobStatusEnum.WAIT.getCode());
            alarmJobMapper.insertAlarmJob(job);
        }
    }

    private AlarmGroup setAlarmGroup(AlarmMessageDto alarmMessageDto, Map<String, Object> data) {
        List<SysDictData> dictDatas = sysDictDataMapper.selectDictDataByType(alarmMessageDto.getAlarmId());
        AlarmGroup alarmGroup = new AlarmGroup();
        if (data.containsKey("$$node1")) {
            String node1 = this.getDictData(dictDatas, data.get("$$node1").toString());
            alarmGroup.setNode1(node1);
        }
        if (data.containsKey("$$node2")) {
            String node2 = this.getDictData(dictDatas, data.get("$$node2").toString());
            alarmGroup.setNode2(node2);
        }
        if (data.containsKey("$$node3")) {
            String node3 = this.getDictData(dictDatas, data.get("$$node3").toString());
            alarmGroup.setNode3(node3);
        }
        if (data.containsKey("$$node4")) {
            String node4 = this.getDictData(dictDatas, data.get("$$node4").toString());
            alarmGroup.setNode4(node4);
        }
        if (data.containsKey("$$node5")) {
            String node5 = this.getDictData(dictDatas, data.get("$$node5").toString());
            alarmGroup.setNode5(node5);
        }
        if (data.containsKey("$$node6")) {
            String node6 = this.getDictData(dictDatas, data.get("$$node6").toString());
            alarmGroup.setNode6(node6);
        }
        if (data.containsKey("$$node7")) {
            String node7 = this.getDictData(dictDatas, data.get("$$node7").toString());
            alarmGroup.setNode7(node7);
        }
        if (data.containsKey("$$node8")) {
            String node8 = this.getDictData(dictDatas, data.get("$$node8").toString());
            alarmGroup.setNode8(node8);
        }
        if (data.containsKey("$$node9")) {
            String node9 = this.getDictData(dictDatas, data.get("$$node9").toString());
            alarmGroup.setNode9(node9);
        }
        if (StringUtils.isNull(alarmGroup.getNode2()) && StringUtils.isNull(alarmGroup.getNode3())
                && StringUtils.isNull(alarmGroup.getNode4()) && StringUtils.isNull(alarmGroup.getNode5())
                && StringUtils.isNull(alarmGroup.getNode6()) && StringUtils.isNull(alarmGroup.getNode7())
                && StringUtils.isNull(alarmGroup.getNode8()) && StringUtils.isNull(alarmGroup.getNode9())) {
            return null;
        }
        return alarmGroup;
    }

    private String getDictData(List<SysDictData> dictDatas, String dictLabel) {
        final String label = StringUtils.isNull(dictLabel) ? "" : dictLabel;
        return dictDatas.stream()
                .filter(d -> d.getDictLabel().equals(label))
                .map(SysDictData::getDictValue)
                .distinct()
                .findFirst()
                .orElse(label);
    }

    private String getShift(Date datetime) {
        Date createDate = DateUtils.truncate(datetime, Calendar.DATE);
        Date startTime = DateUtils.addMinutes(DateUtils.addHours(createDate, 7), 30);
        Date endTime = DateUtils.addMinutes(DateUtils.addHours(createDate, 19), 30);
        if (datetime.compareTo(startTime) >= 0 && datetime.compareTo(endTime) < 0) {
            return "A";
        } else {
            return "B";
        }
    }

    private void createLogRecord(Map<String, Object> log) {
        AlarmLog alarmLog = new AlarmLog();
        alarmLog.setAlarmId(log.get("alarm_id").toString());
        alarmLog.setLogType(log.get("log_type").toString());
        alarmLog.setSystemName(log.get("system_name").toString());
        alarmLog.setCreateTime(DateUtils.parseDate(log.get("create_time")));
        alarmLog.setResponseTime(DateUtils.parseDate(log.get("response_time")));
        alarmLog.setRequestTime(DateUtils.parseDate(log.get("request_time")));
        alarmLog.setRequestData(log.get("request_data").toString());
        alarmLog.setResponseData(log.get("response_data").toString());
        alarmLog.setStatus(log.get("status").toString());
        alarmLog.setTimeOut(Long.parseLong(log.get("time_out").toString()));
        alarmLogMapper.insertAlarmLog(alarmLog);
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
            } else if (entry.getValue() instanceof List) {
                List<Object> list = (List<Object>) entry.getValue();
                // Xử lý array
                for (int i = 0; i < list.size(); i++) {
                    Object item = list.get(i);
                    if (item instanceof Map) {
                        Map<String, Object> itemMap = (Map<String, Object>) item;
                        flatMap.putAll(flattenJson(itemMap, key + "[" + i + "]"));
                    } else if (item instanceof List) {
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
            } else {
                flatMap.put(key, String.valueOf(entry.getValue()));
            }
        }
        return flatMap;
    }

    @Override
    public Map<String, Object> sendMessage(AlarmAction alarmAction, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        List<AlarmRegister> registers = alarmRegisterMapper.selectAlarmRegisterListByActionId(alarmAction.getActionId());
        if (StringUtils.isNull(registers))
            throw new RuntimeException("No registered user found for this alarm action!");

        List<AlarmTemplate> templates = alarmTemplateMapper.selectAlarmTemplateByActionId(alarmAction.getActionId());
        if (StringUtils.isNull(templates))
            throw new RuntimeException("No template found for this alarm action!");

        List<AlarmRegister> emailRegisterList = registers.stream().filter(x -> StringUtils.containsAnyIgnoreCase(x.getRegisterType(), ActionTypeEnum.EMAIL.getCode())).collect(Collectors.toList());
        if(StringUtils.isNotEmpty(emailRegisterList)){
            
            AlarmTemplate alarmTemplate = templates.stream().filter(x -> StringUtils.containsAnyIgnoreCase(x.getTemplateType(),ActionTypeEnum.EMAIL.getCode())).findFirst().orElse(null);
            if (StringUtils.isNull(alarmTemplate))
                throw new RuntimeException("No template found for email alarm!");
            Map<String, Object> emailResult = sendEmail(emailRegisterList, alarmTemplate.getTemplate(), strMessage);
            result.put("email_result", emailResult);
        }

        List<AlarmRegister> dingtalkGroupRegisterList = registers.stream().filter(x -> StringUtils.containsAnyIgnoreCase(x.getRegisterType(), ActionTypeEnum.DINGDING_GROUP.getCode())).collect(Collectors.toList());
        if(StringUtils.isNotEmpty(dingtalkGroupRegisterList)){
            AlarmTemplate alarmTemplate = templates.stream().filter(x -> x.getTemplateType() == ActionTypeEnum.DINGDING_GROUP.getCode()).findFirst().orElse(null);
            if (StringUtils.isNull(alarmTemplate))
                throw new RuntimeException("No template found for dingding group alarm!");
            Map<String, Object> dingtalkGroupResult = sendDingDing(dingtalkGroupRegisterList, alarmTemplate.getTemplate(), strMessage);
            result.put("dingtalk_group_result", dingtalkGroupResult);
        }
        return result;
    }

    @SuppressWarnings("unchecked")
    private String buildMessage(String template, String strMessage) {
        try {
            // Parse template and message YAML
            Yaml yaml = new Yaml();
            Map<String, Object> templateMap = yaml.load(template);
            Map<String, Object> messageMap = yaml.load(strMessage);

            // Flatten the message map for variable replacement
            Map<String, String> variables = flattenJson(messageMap, "");

            // Process messages array in template
            StringBuilder result = new StringBuilder();
            if (templateMap.containsKey("messages")) {
                List<Map<String, Object>> messages = (List<Map<String, Object>>) templateMap.get("messages");
                for (Map<String, Object> message : messages) {
                    // Add title if exists
                    if (message.containsKey("title")) {
                        result.append(message.get("title")).append("\n");
                        result.append(
                                String.join("", Collections.nCopies(message.get("title").toString().length(), "=")))
                                .append("\n");
                    }

                    // Process content if exists
                    if (message.containsKey("content")) {
                        String content = message.get("content").toString();
                        result.append(setVariable(content, variables)).append("\n\n");
                    }
                }
            }

            return result.toString().trim();
        } catch (Exception e) {
            return strMessage;
        }
    }

    @Async
    public Map<String, Object> sendEmail(List<AlarmRegister> registers, String template, String strMessage) {
        List<Map<String, Object>> listData = new ArrayList<Map<String, Object>>();
        String message = buildMessage(template, strMessage);
        for (AlarmRegister alarmRegister : registers) {
            SysUser userInfo =  sysUserMapper.selectUserByUserUUID(alarmRegister.getRegister());
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("register", userInfo.getEmail());
            data.put("message", message);
            try {
                AlarmConfig alarmConfig = alarmConfigMapper.selectAlarmConfigByConfigType("EMAIL");
                Map<String, Object> config = JSONObject.parse(alarmConfig.getConfig());
                String sendTo = (String) config.get("sendTo");
                String Username = (String) config.get("Username");
                String Password = AESUtils.decrypt((String) config.get("Password"));
                String smtpHost = (String) config.get("smtpHost");
                String smtpPort = (String) config.get("smtpPort");
                String smtpAuth = (String) config.get("smtpAuth");
                String smtpSslEnable = (String) config.get("smtpSslEnable");
    
                String subject = "Alarm Notification";
                Properties props = new Properties();
                props.put("mail.smtp.host", smtpHost);
                props.put("mail.smtp.port", smtpPort);
                props.put("mail.smtp.auth", smtpAuth);
                props.put("mail.smtp.ssl.enable", smtpSslEnable);
    
                Session session = Session.getInstance(props, new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(Username, Password);
                    }
                });
                Message emailMessage = new MimeMessage(session);
                emailMessage.setFrom(new InternetAddress(EmailConfig.getUsername()));
                emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
                emailMessage.setSubject(subject);
                emailMessage.setText(message);
                Transport.send(emailMessage);
                data.put("status", "Email sent successfully!");
                data.put("code", 0);
            } catch (Exception e) {
                data.put("status", e.getMessage());
                data.put("code", -1);
            }
            finally{
                listData.add(data);
            }
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("data", listData);
        return result;
    }

    @Async
    public Map<String, Object> sendDingDing(List<AlarmRegister> registers, String template, String strMessage) {
        List<Map<String, Object>> listData = new ArrayList<Map<String, Object>>();
        String message = buildMessage(template, strMessage);
        for (AlarmRegister alarmRegister : registers) {
            SysUser userInfo =  sysUserMapper.selectUserByUserUUID(alarmRegister.getRegister());
            Map<String, Object> data = new HashMap<String, Object>();
            Map<String, Object> bodyObject = new HashMap<String, Object>();
            bodyObject.put("msgtype", "text");
            Map<String, Object> text = new HashMap<String, Object>();
            text.put("content", message);
            bodyObject.put("text", text);
            String body = JSONObject.toJSONString(bodyObject);
            data.put("register", userInfo.getEmail());
            data.put("message", body);
            try {
                AlarmConfig alarmConfig = alarmConfigMapper.selectAlarmConfigByConfigType("EMAIL");
                Map<String, Object> config = JSONObject.parse(alarmConfig.getConfig());
                String webhook = (String) config.get("webhook");
                JSONObject header = new JSONObject();
                header.put("Content-Type", "application/json");
                String response = HttpUtils.sendPost(webhook, body, header);
                JSONObject responseObject = JSONObject.parseObject(response);
                if (responseObject.getInteger("errcode") != 0) {
                    throw new RuntimeException(response);
                }
                data.put("status", response);
                data.put("code", 0);
            } catch (Exception e) {
                data.put("status", e.getMessage());
                data.put("code", -1);
            }
            finally{
                listData.add(data);
            }
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("data", listData);
        return result;
    }

    @Async
    public Map<String, Object> sendITSM(List<AlarmRegister> registers, String template, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("request_data", strMessage);
        return result;
    }

    @Async
    public Map<String, Object> sendWatcher(List<AlarmRegister> registers, String template, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("request_data", strMessage);
        return result;
    }
}
