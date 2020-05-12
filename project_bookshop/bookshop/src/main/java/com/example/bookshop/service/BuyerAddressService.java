package com.example.bookshop.service;

import com.example.bookshop.domain.Address;
import com.example.bookshop.domain.BuyerAddress;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/22 14:08
 */
public interface BuyerAddressService {
    void add(BuyerAddress buyer_address) throws AddException;

    void delete(Serializable id) throws DeleteException;

    int updateIsDefault(BuyerAddress buyerAddress) throws UpdateException;

    BuyerAddress findByBuyer(Serializable buyerId);

    List<BuyerAddress> findAll();

    List<Address> findAddressByBuyer(Serializable buyerId);
}
