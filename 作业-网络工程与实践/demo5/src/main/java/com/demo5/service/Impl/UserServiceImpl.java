package com.demo5.service.Impl;

import com.demo5.dao.IUserDao;
import com.demo5.model.User;
import com.demo5.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(String userId) {
        return userDao.selectUser(userId);
    }
}