package com.example.service.impl;

import com.example.dao.UserDao;
import com.example.domain.User;
import com.example.exception.AddUserException;
import com.example.service.UserService;
import com.example.utils.StringFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 添加用户，一般来说需要检查用户为空、用户名为空、密码为空
     */
    public void add(User user) throws AddUserException {
        if (user == null
            || StringFormatUtil.isEmpty(user.getId())
            || StringFormatUtil.isEmpty(user.getName())
            || StringFormatUtil.isEmpty(user.getPassword())
            || StringFormatUtil.isEmpty(user.getTel())
            || userDao.findOneById(user.getId()) != null) {
            throw new AddUserException("注册错误：id为空/id已被注册/姓名为空/密码为空/手机号为空");
        }

        int result = 0; //受影响的行数默认为0
        try {
            result = userDao.add(user);
        } catch (Exception e) {
            System.out.println("注册用户失败");
        }
        if (result > 0) System.out.println("注册用户成功");
    }
}
