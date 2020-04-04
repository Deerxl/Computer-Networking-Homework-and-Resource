package com.example.bookshop.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class StringFormatUtil {
    /**
     * 判断给定字符串 去除首尾空格后 是否为空或者包含空格
     */
    public static boolean hasEmpty(String input) {
        if (input == null || input.length() == 0)
            return true;
        String temp = input.trim();
        if (temp.length() == 0) return true;
        for (int i = 0; i < temp.length(); i++) {
            char c = temp.charAt(i);
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') {
                return true;
            }
        }
        return false;
    }

    /**
     * 判断是不是一个合法的手机号码，含空格则不是
     */
    public static boolean isPhoneNum(String phoneNum) {
        Pattern phone = Pattern
                .compile("^[1]([3-9])[0-9]{9}$");
        if (hasEmpty(phoneNum.trim())) return false;
        return phone.matcher(phoneNum).matches();
    }

    /**
     * 判断输入是不是数字
     */
    public static boolean isDouble(String input) {
        try {
            Double.parseDouble(input.trim());
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * 返回当前系统时间 yyyy-MM-dd
     */
    public static String getDataTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(new Date());
    }

    /**
     * 判断一个字符串是不是数字
     */
    public static boolean isNumber(String str) {
        try {
            Integer.parseInt(str.trim());
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
