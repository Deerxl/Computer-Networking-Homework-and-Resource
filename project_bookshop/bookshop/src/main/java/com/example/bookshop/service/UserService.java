package com.example.bookshop.service;

import com.example.bookshop.domain.User;
import com.example.bookshop.exception.AddUserException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;

import java.io.Serializable;
import java.util.List;

public interface UserService {

    /**
     * 添加用户
     * @param user 待添加的对象
     */
    void add(User user) throws AddUserException;

    /**
     * 删除用户
     * @param user 待删除对象
     */
    void delete(User user) throws DeleteException;

    /**
     * 更新用户
     * @param user 待更新对象
     */
    void update(User user) throws UpdateException;

    /**
     * 通过ID查找一个用户
     * @param id    待查询的对象的ID
     * @return  返回该ID对应的对象
     */
    User findOneById(Serializable id);

    /**
     * 查找全部用户
     * @return  返回对象集合
     */
    List<User> findAll();
}