package com.example.bookshop.service;

import com.example.bookshop.domain.Address;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/22 0:49
 */
public interface AddressService extends BaseService<Address> {
    @Override
    void add(Address address) throws AddException;

    @Override
    void delete(Serializable id) throws DeleteException;

    @Override
    void update(Address address) throws UpdateException;

    @Override
    Address findOneById(Serializable id);

    @Override
    List<Address> findAll();
}
