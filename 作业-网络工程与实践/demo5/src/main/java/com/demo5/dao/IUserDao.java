package com.demo5.dao;

import com.demo5.model.User;

public interface IUserDao {

    User selectUser(String id);
}