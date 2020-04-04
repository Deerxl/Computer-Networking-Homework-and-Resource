package com.example.bookshop.service.Impl;

import com.example.bookshop.dao.UserDao;
import com.example.bookshop.domain.User;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.UserService;
import com.example.bookshop.util.StringFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void add(User user) throws AddException {
        if (user == null
        || StringFormatUtil.hasEmpty(user.getId())
        || userDao.findOneById(user.getId()) != null
        || StringFormatUtil.hasEmpty(user.getName())
        || StringFormatUtil.hasEmpty(user.getPassword())
        || StringFormatUtil.isPhoneNum(user.getTel())) {
            throw new AddException("添加用户错误：id为空/id已被注册/姓名含空/密码含空/手机号含空/手机号格式不正确");
        }

        int result = 0;
        try {
            result = userDao.add(user);
        } catch (Exception e) {
            System.out.println("添加用户失败");
            e.printStackTrace();
        }
        if (result > 0) System.out.println("添加用户成功");
    }

    @Override
    public void delete(User user) throws DeleteException {
        if (user == null)
            throw new DeleteException("删除用户错误：用户为空");

        int result = 0;
        try {
            result = userDao.delete(user);
        } catch (Exception e) {
            System.out.println("删除用户失败");
            e.printStackTrace();
        }
        if (result > 0) System.out.println("删除用户成功");
    }

    @Override
    public void update(User user) throws UpdateException {
        if (user == null)
            throw new UpdateException("更新用户错误：用户为空");

        int result = 0;
        try {
            result = userDao.update(user);
        } catch (Exception e) {
            System.out.println("更新用户失败");
            e.printStackTrace();
        }
        if (result > 0) System.out.println("更新用户成功");
    }

    @Override
    public User findOneById(Serializable id) {
        if (id == null)
            return null;
        return userDao.findOneById(id);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

}
