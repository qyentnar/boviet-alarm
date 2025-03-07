package com.boviet.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import com.boviet.common.utils.AESUtils;

@Component
@ConfigurationProperties(prefix = "email")
public class EmailConfig {

    private static String smtpHost;

    private static String smtpPort;

    private static String smtpAuth;

    private static String smtpSslEnable;

    private static String username;

    private static String password;

    public static String getSmtpHost() {
        return smtpHost;
    }

    public void setSmtpHost(String smtpHost) {
        EmailConfig.smtpHost = smtpHost == null ? "" : smtpHost;
    }

    public static String getSmtpPort() {
        return smtpPort;
    }

    public void setSmtpPort(String smtpPort) {
        EmailConfig.smtpPort = smtpPort == null ? "" : smtpPort;
    }

    public static String getSmtpAuth() {
        return smtpAuth;
    }

    public void setSmtpAuth(String smtpAuth) {
        EmailConfig.smtpAuth = smtpAuth == null ? "" : smtpAuth;
    }

    public static String getSmtpSslEnable() {
        return smtpSslEnable;
    }

    public void setSmtpSslEnable(String smtpSslEnable) {
        EmailConfig.smtpSslEnable = smtpSslEnable == null ? "" : smtpSslEnable;
    }

    public static String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        EmailConfig.username = username == null ? "" : username;
    }

    public static String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        EmailConfig.password = AESUtils.decrypt(password) == null ? "" : AESUtils.decrypt(password);
    }
}
