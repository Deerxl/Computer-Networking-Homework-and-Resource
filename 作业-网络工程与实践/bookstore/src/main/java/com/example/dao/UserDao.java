package com.example.dao;

import com.example.domain.User;

import java.io.Serializable;
import java.util.List;

public interface UserDao extends Dao<User> {
    int add(User user);

    int delete(User user);

    int update(User user);

    User findOneById(Serializable id);

    List<User> findAll();
}
