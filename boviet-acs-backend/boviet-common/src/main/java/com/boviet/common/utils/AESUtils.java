package com.boviet.common.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class AESUtils {
    private static final String ALGORITHM = "AES";
    private static final String SECRET_KEY = "82498345-673e-443d-8edb-2d9840a174ca";

    public static String encrypt(String text){
        try{
            SecretKey secretKey = getSecretKey(SECRET_KEY);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            byte[] encryptedBytes = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));
            return toHex(encryptedBytes);
        }
        catch (Exception e) {
            return StringUtils.EMPTY;
        }
    }

    public static String decrypt(String encryptedHex){
        try{
            SecretKey secretKey = getSecretKey(SECRET_KEY);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            byte[] decodedBytes = toByteArray(encryptedHex);
            byte[] decryptedBytes = cipher.doFinal(decodedBytes);
            return new String(decryptedBytes, StandardCharsets.UTF_8);
        }
        catch (Exception e) {
            return StringUtils.EMPTY;
        }
    }

    private static SecretKey getSecretKey(String key) throws Exception {
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        byte[] keyBytes = sha.digest(key.getBytes(StandardCharsets.UTF_8));
        return new SecretKeySpec(keyBytes, 0, 16, ALGORITHM);
    }

    private static String toHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xFF & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString().toUpperCase();
    }

    private static byte[] toByteArray(String hex) {
        int len = hex.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4) + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }
}
