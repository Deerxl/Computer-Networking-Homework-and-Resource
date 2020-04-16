package com.example.bookshop.exception;

/**
 * @author Alu
 * @date 2020/4/17 1:27
 */
public class SelectException extends Exception {
    public SelectException(String message) {
        super(message);
    }

    public SelectException(String message, Throwable cause) {
        super(message, cause);
    }
}
