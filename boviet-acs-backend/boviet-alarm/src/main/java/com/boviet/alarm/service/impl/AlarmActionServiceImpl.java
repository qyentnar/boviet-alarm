package com.boviet.alarm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.boviet.common.config.EmailConfig;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.http.HttpUtils;
import com.boviet.common.utils.uuid.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.boviet.alarm.mapper.AlarmActionMapper;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.enums.ActionTypeEnum;
import com.boviet.alarm.service.IAlarmActionService;

/**
 * Alarm ActionAction业务层处理
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Service
public class AlarmActionServiceImpl implements IAlarmActionService {
    @Autowired
    private AlarmActionMapper alarmActionMapper;

    /**
     * 查询Alarm Action
     * 
     * @param id Alarm Action主键
     * @return Alarm Action
     */
    @Override
    public AlarmAction selectAlarmActionById(Long id) {
        return alarmActionMapper.selectAlarmActionById(id);
    }

    /**
     * 查询Alarm Action列表
     * 
     * @param alarmAction Alarm Action
     * @return Alarm Action
     */
    @Override
    public List<AlarmAction> selectAlarmActionList(AlarmAction alarmAction) {
        return alarmActionMapper.selectAlarmActionList(alarmAction);
    }

    /**
     * 新增Alarm Action
     * 
     * @param alarmAction Alarm Action
     * @return 结果
     */
    @Override
    public int insertAlarmAction(AlarmAction alarmAction) {
        alarmAction.setCreateTime(DateUtils.getNowDate());
        alarmAction.setActionId(UUID.randomUUID().toString());
        return alarmActionMapper.insertAlarmAction(alarmAction);
    }

    /**
     * 修改Alarm Action
     * 
     * @param alarmAction Alarm Action
     * @return 结果
     */
    @Override
    public int updateAlarmAction(AlarmAction alarmAction) {
        alarmAction.setUpdateTime(DateUtils.getNowDate());
        return alarmActionMapper.updateAlarmAction(alarmAction);
    }

    /**
     * 批量删除Alarm Action
     * 
     * @param ids 需要删除的Alarm Action主键
     * @return 结果
     */
    @Override
    public int deleteAlarmActionByIds(Long[] ids) {
        return alarmActionMapper.deleteAlarmActionByIds(ids);
    }

    /**
     * 删除Alarm Action信息
     * 
     * @param id Alarm Action主键
     * @return 结果
     */
    @Override
    public int deleteAlarmActionById(Long id) {
        return alarmActionMapper.deleteAlarmActionById(id);
    }

    @Override
    public Map<String, Object> sendMessage(AlarmAction alarmAction, String strMessage) {
        String actionType = alarmAction.getActionType();
        if (ActionTypeEnum.EMAIL.getCode().equalsIgnoreCase(actionType)) {
            return sendEmail(alarmAction, strMessage);
        } else if (ActionTypeEnum.DINGDING.getCode().equalsIgnoreCase(actionType)) {
            return sendDingDing(alarmAction, strMessage);
        } else if (ActionTypeEnum.ITSM.getCode().equalsIgnoreCase(actionType)) {
            return sendITSM(alarmAction, strMessage);
        } else if (ActionTypeEnum.WATCHER.getCode().equalsIgnoreCase(actionType)) {
            return sendWatcher(alarmAction, strMessage);
        } else {
            throw new RuntimeException("Action Type is not supported!");
        }
    }

    @Async
    public Map<String, Object> sendEmail(AlarmAction alarmAction, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("request_data", strMessage);
        try {
            Map<String, Object> config = JSONObject.parse(alarmAction.getConfig());
            String sendTo = (String) config.get("sendTo");
            String Username = (String) config.get("Username");
            String Password = (String) config.get("Password");
            String smtpHost = (String) config.get("smtpHost");
            String smtpPort = (String) config.get("smtpPort");
            String smtpAuth = (String) config.get("smtpAuth");
            String smtpSslEnable = (String) config.get("smtpSslEnable");

            String subject = "Alarm Notification";
            String body = strMessage;
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
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EmailConfig.getUsername()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
            message.setSubject(subject);
            message.setText(body);
            Transport.send(message);
            result.put("response_data", "Email sent successfully!");
            result.put("code", 0);
        } catch (Exception e) {
            result.put("response_data", e.getMessage());
            result.put("code", -1);
        }
        return result;
    }

    @Async
    public Map<String, Object> sendDingDing(AlarmAction alarmAction, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("msgtype", "text");
        Map<String, Object> text = new HashMap<String, Object>();
        text.put("content", strMessage);
        message.put("text", text);
        String body = JSONObject.toJSONString(message);
        result.put("request_data", body);
        try {
            Map<String, Object> config = JSONObject.parse(alarmAction.getConfig());
            String webhook = (String) config.get("webhook");
            JSONObject header = new JSONObject();
            header.put("Content-Type", "application/json");
            String response = HttpUtils.sendPost(webhook, body, header);
            JSONObject responseObject = JSONObject.parseObject(response);
            if (responseObject.getInteger("errcode") != 0) {
                throw new RuntimeException(response);
            }
            result.put("response_data", response);
            result.put("code", 0);
        } catch (Exception e) {
            result.put("response_data", e.getMessage());
            result.put("code", -1);
        }
        return result;
    }

    @Async
    public Map<String, Object> sendITSM(AlarmAction alarmAction, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("request_data", strMessage);
        return result;
    }

    @Async
    public Map<String, Object> sendWatcher(AlarmAction alarmAction, String strMessage) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("request_data", strMessage);
        return result;
    }
}
