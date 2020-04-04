package com.example.bookshop.service.Impl;

import com.example.bookshop.dao.UserDao;
import com.example.bookshop.domain.User;
import com.example.bookshop.exception.AddUserException;
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
    public void add(User user) throws AddUserException {
        if (user == null
                || StringFormatUtil.isEmpty(user.getId())
                || StringFormatUtil.isEmpty(user.getName())
                || StringFormatUtil.isEmpty(user.getPassword())
                || StringFormatUtil.isEmpty(user.getTel())
                || userDao.findOneById(user.getId()) != null) {
            throw new AddUserException("添加错误：id为空/id已被注册/姓名为空/密码为空/手机号为空");
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
            throw new DeleteException("删除错误：用户为空");

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
            throw new UpdateException("更新错误：用户为空");

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
