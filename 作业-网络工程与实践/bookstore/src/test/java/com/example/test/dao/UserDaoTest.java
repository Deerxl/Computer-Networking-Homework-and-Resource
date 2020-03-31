package com.example.test.dao;

import com.example.dao.UserDao;
import com.example.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class) //spring的单元测试
@ContextConfiguration({"classpath:spring/spring-*.xml"})    //上下文配置
public class UserDaoTest {

    @Autowired
    private UserDao userDao;    //初始化Dao层，面向接口编程

    @Test
    public void testAdd() {
        User user = new User();
        user.setId("0331testAdd");
        user.setName("testAdd");
        user.setPassword("123456");
        user.setTel("17362447820");
        user.setAuthority(1);

        int result = 0; //受影响的行数默认为0
        try {
            result = userDao.add(user);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("添加用户失败");
        }
        if (result > 0) System.out.println("添加用户成功");
    }

    @Test
    public void testFindOneId() throws Exception {
        User user = new User();
        user.setId("0331testFindOneId");
        user.setName("testFindOneId");
        user.setPassword("123456");
        user.setTel("17362447820");
        user.setAuthority(1);

        User result = null; //受影响的行数默认为0
        try {
            result = userDao.findOneById("0330");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找用户失败");
        }
        if (result != null) {
            System.out.println("查找用户成功");
            System.out.println(result.toString());
        }
    }

    @Test
    public void testDelete() {
        User user = new User();
        user.setId("0331testDelete");
        user.setName("testDelete");
        user.setPassword("123456");
        user.setTel("17362447820");
        user.setAuthority(1);

        int result = 0; //受影响的行数默认为0
        try {
            result = userDao.delete(user);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("删除用户失败");
        }
        if (result > 0) System.out.println("删除用户成功");
    }

    @Test
    public void testUpdate() {
        User user = new User();
        user.setId("0331testUpdate");
        user.setName("testUpdate");
        user.setPassword("123456");
        user.setTel("17362447820");
        user.setAuthority(1);

        int result = 0; //受影响的行数默认为0
        try {
            result = userDao.update(user);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("更新用户失败");
        }
        if (result > 0) System.out.println("更新用户成功");
    }
}