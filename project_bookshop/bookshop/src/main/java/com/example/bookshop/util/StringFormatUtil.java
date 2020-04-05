package com.example.bookshop.util;

import org.springframework.web.context.request.WebRequest;

import javax.activation.MimetypesFileTypeMap;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
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

    /**
     * 判断给定的路径是否为图片，适用的图片格式为：bmp/gif/jpeg/jpg/png/raw/tif
     * @param imagePath 图片路径
     * @return 是否为图片路径
     */
    public static boolean isImage(String imagePath) {
        MimetypesFileTypeMap mtftp = new MimetypesFileTypeMap();
        mtftp.addMimeTypes("image bmp gif jpeg jpg png raw tif");
        String mimetype= mtftp.getContentType(imagePath);
        String type = mimetype.split("/")[0];
        if(!type.equals("image")) return false;

        try {
            BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
            if (bufferedImage != null) return true;
        } catch (IOException e) {
            //e.printStackTrace();
        }
        try {
            URL url = new URL(imagePath);
            HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
            return urlCon.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
