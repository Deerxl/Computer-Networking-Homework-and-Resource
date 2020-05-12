package com.example.bookshop.service.Impl;

import com.example.bookshop.dao.AddressDao;
import com.example.bookshop.dao.OrderDao;
import com.example.bookshop.dao.UserDao;
import com.example.bookshop.domain.Order;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.OrderService;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/21 23:39
 */
@Service
public class OrderServiceImpl implements OrderService {
    private final OrderDao orderDao;
    private final UserDao userDao;
    private final AddressDao addressDao;

    public OrderServiceImpl(OrderDao orderDao, UserDao userDao, AddressDao addressDao) {
        this.orderDao = orderDao;
        this.userDao = userDao;
        this.addressDao = addressDao;
    }

    @Override
    public void add(Order order) throws AddException {
        if (order == null || order.getId() == null || order.getId().length() == 0 || findOneById(order.getId()) != null) {
            throw new AddException("添加订单错误：订单为空/id为空/id已重复");
        } else if (order.getBuyer() == null || userDao.findOneById(order.getBuyer()) == null) {
            throw new AddException("添加订单错误：买家为空/买家信息未存储");
        } else if (order.getAddress() == null || addressDao.findOneById(order.getAddress()) == null) {
            throw new AddException("添加订单错误：地址为空/地址未存储");
        } else if (order.getPrice() < 0) {
            throw new AddException("添加订单错误：总价范围不正确");
        }

        int result;
        try {
            result = orderDao.add(order);
        } catch (Exception e) {
            System.out.println("添加订单失败");
            e.printStackTrace();
            throw new AddException("添加订单失败：" + e.getMessage());
        }
        if (result > 0) System.out.println("添加订单成功");
    }

    @Override
    public void delete(Serializable id) throws DeleteException {
        if (id == null || orderDao.findOneById(id) == null)
            throw new DeleteException("删除订单失败：订单为空");

        int result;
        try {
            result = orderDao.delete(id);
        } catch (Exception e) {
            System.out.println("删除订单失败");
            e.printStackTrace();
            throw new DeleteException("删除订单失败：" + e.getMessage());
        }
        if (result > 0) System.out.println("删除订单成功");
    }

    @Override
    public void update(Order order) throws UpdateException {
        if (order == null || order.getId() == null) {
            throw new UpdateException("更新订单错误：订单为空/id为空");
        } else if (order.getBuyer() == null || userDao.findOneById(order.getBuyer()) == null) {
            throw new UpdateException("更新订单错误：买家为空/买家信息未存储");
        } else if (order.getAddress() == null || addressDao.findOneById(order.getAddress()) == null) {
            throw new UpdateException("更新订单错误：地址为空/地址未存储");
        } else if (order.getPrice() < 0) {
            throw new UpdateException("更新订单错误：总价范围不正确");
        }

        int result;
        try {
            result = orderDao.update(order);
        } catch (Exception e) {
            System.out.println("更新订单失败");
            e.printStackTrace();
            throw new UpdateException("更新订单失败：" + e.getMessage());
        }
        if (result > 0) System.out.println("更新订单成功");
    }

    @Override
    public Order findOneById(Serializable id) {
        return orderDao.findOneById(id);
    }

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }
}
