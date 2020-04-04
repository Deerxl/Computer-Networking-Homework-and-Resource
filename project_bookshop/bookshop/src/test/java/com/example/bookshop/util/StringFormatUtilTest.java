package com.example.bookshop.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class StringFormatUtilTest {

    @Test
    public void hasEmpty() {
        String str1 = null;
        String str2 = "";
        String str3 = " dcd  ";
        String str4 = " d c  ";
        String str5 = "///sxa";

        assertTrue(StringFormatUtil.hasEmpty(str1));
        assertTrue(StringFormatUtil.hasEmpty(str2));
        assertFalse(StringFormatUtil.hasEmpty(str3));
        assertTrue(StringFormatUtil.hasEmpty(str4));
        assertFalse(StringFormatUtil.hasEmpty(str5));
    }

    @Test
    public void isPhoneNum() {
        String str1 = null;
        String str2 = "";
        String str3 = "12345678910";
        String str4 = "17362447820";
        String str5 = "12345678";

        assertFalse(StringFormatUtil.isPhoneNum(str1));
        assertFalse(StringFormatUtil.isPhoneNum(str2));
        assertFalse(StringFormatUtil.isPhoneNum(str3));
        assertTrue(StringFormatUtil.isPhoneNum(str4));
        assertFalse(StringFormatUtil.isPhoneNum(str5));
    }

    @Test
    public void isDouble() {
        String str1 = null;
        String str2 = "";
        String str3 = "123 ";
        String str4 = " 1.2";
        String str5 = "￥1.2";

        assertFalse(StringFormatUtil.isDouble(str1));
        assertFalse(StringFormatUtil.isDouble(str2));
        assertTrue(StringFormatUtil.isDouble(str3));
        assertTrue(StringFormatUtil.isDouble(str4));
        assertFalse(StringFormatUtil.isDouble(str5));
    }

    @Test
    public void getDataTime() {
        String time = StringFormatUtil.getDataTime();
        assertNotNull(time);
    }

    @Test
    public void isNumber() {
        String str1 = null;
        String str2 = "";
        String str3 = "123 ";
        String str4 = " 1. 2";
        String str5 = "￥1.2";

        assertFalse(StringFormatUtil.isNumber(str1));
        assertFalse(StringFormatUtil.isNumber(str2));
        assertTrue(StringFormatUtil.isNumber(str3));
        assertFalse(StringFormatUtil.isNumber(str4));
        assertFalse(StringFormatUtil.isNumber(str5));
    }
}