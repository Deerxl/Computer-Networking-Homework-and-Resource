package com.example.bookshop.service;

import com.example.bookshop.domain.Order;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/21 23:38
 */
public interface OrderService extends BaseService<Order> {
    @Override
    void add(Order order) throws AddException;

    @Override
    void delete(Serializable id) throws DeleteException;

    @Override
    void update(Order order) throws UpdateException;

    @Override
    Order findOneById(Serializable id);

    @Override
    List<Order> findAll();
}
