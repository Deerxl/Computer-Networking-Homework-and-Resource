package com.example.bookshop.service.Impl;

import com.example.bookshop.domain.Address;
import com.example.bookshop.domain.BuyerAddress;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.BuyerAddressService;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/22 14:10
 */
public class BuyerAddressImpl implements BuyerAddressService {
    @Override
    public void add(BuyerAddress buyer_address) throws AddException {

    }

    @Override
    public void delete(Serializable id) throws DeleteException {

    }

    @Override
    public int updateIsDefault(BuyerAddress buyerAddress) throws UpdateException {
        return 0;
    }

    @Override
    public BuyerAddress findByBuyer(Serializable buyerId) {
        return null;
    }

    @Override
    public List<BuyerAddress> findAll() {
        return null;
    }

    @Override
    public List<Address> findAddressByBuyer(Serializable buyerId) {
        return null;
    }
}
