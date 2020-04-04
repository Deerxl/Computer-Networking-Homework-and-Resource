package com.example.bookshop.controller;

import com.example.bookshop.domain.User;
import com.example.bookshop.exception.AddUserException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    /**
     * 增加用户 URL: /user/add
     * @param user 待添加的对象
     */
    @RequestMapping("/add")
    public void add(User user) throws AddUserException {
        userService.add(user);
    }

    /**
     * 删除用户 URL: /user/delete
     * @param user 待删除的对象
     */
    @RequestMapping("/delete")
    public void delete(User user) throws DeleteException {
        userService.delete(user);
    }

    /**
     * 更新用户 URL: /user/update
     * @param user 待更新的对象
     */
    @RequestMapping("/update")
    public void update(User user) throws UpdateException {
        userService.update(user);
    }

    /**
     * 通过ID查找用户 URL: /user/findUserById
     * @param id 待查找的用户ID
     * @return 待查找的用户
     */
    @RequestMapping("/findUserById")
    public User findUserById(Serializable id) {
        return userService.findOneById(id);
    }

    @RequestMapping("/findAll")
    public List<User> findAll() {
        return userService.findAll();
    }
}
