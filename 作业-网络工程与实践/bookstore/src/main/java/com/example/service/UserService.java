package com.example.service;

import com.example.domain.User;

public interface UserService extends BaseService<User> {
    void add(User user) throws Exception;
}
