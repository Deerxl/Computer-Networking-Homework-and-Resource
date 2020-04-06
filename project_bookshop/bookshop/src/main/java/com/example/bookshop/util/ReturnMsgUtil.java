package com.example.bookshop.util;

public class ReturnMsgUtil {
    public int state;   //状态：0：成功，1：失败
    public String message;  //相关信息

    public int getStateCode() {
        return state;
    }

    public void setStateCode(int stateCode) {
        this.state = stateCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ReturnMsgUtil(int state, String message) {
        this.state = state;
        this.message = message;
    }

    @Override
    public String toString() {
        return "ReMsgUtil{" +
                "state=" + state +
                ", message='" + message + '\'' +
                '}';
    }
}
