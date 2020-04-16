package com.example.bookshop.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author Alu
 * @date 2020/4/7 17:02
 */
public class MD5Util {

    private static final String salt = "vdu0769fief4";

    /**
     * 用md5进行加密处理
     * @param str 需要加密的字段
     * @return 加密处理结果
     */
    public static String md5Encryption(String str){
        return DigestUtils.md5Hex(str);
    }

    // TODO: 2020/4/17  加密处理
}