package com.example.bookshop.service.Impl;

import com.example.bookshop.dao.AddressDao;
import com.example.bookshop.domain.Address;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.AddressService;
import com.example.bookshop.util.StringFormatUtil;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/22 0:50
 */
@Service
public class AddressServiceImpl implements AddressService {
    private final AddressDao addressDao;

    public AddressServiceImpl(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

    @Override
    public void add(Address address) throws AddException {
        if (address == null || address.getId() == null
          || address.getId().length() == 0 || addressDao.findOneById(address.getId()) != null) {
            throw new AddException("添加地址错误：地址为空/id为空/id已存在");
        } else if (address.getNation() == null || address.getProvince() == null
                || address.getCity() == null || address.getDetails() == null) {
            throw new AddException("添加地址错误：国家/省份/城市/详细信息为空");
        } else if (address.getReceiver() == null || address.getReceiver().length() == 0) {
            throw new AddException("添加地址错误：收货人为空");
        } else if (StringFormatUtil.isPhoneNum(address.getTel())) {
            throw new AddException("添加地址错误：联系电话为空/格式不正确");
        }

        int result;
        try {
            result = addressDao.add(address);
        } catch (Exception e) {
            System.out.println("添加地址失败");
            e.printStackTrace();
            throw new AddException("添加地址失败：" + e.getMessage());
        }
        if (result > 0) System.out.println("添加地址成功");
    }

    @Override
    public void delete(Serializable id) throws DeleteException {
        if (id == null || addressDao.findOneById(id) == null)
            throw new DeleteException("删除地址失败：地址为空/id为空");

        int result;
        try {
            result = addressDao.delete(id);
        } catch (Exception e) {
            System.out.println("删除地址失败");
            e.printStackTrace();
            throw new DeleteException("删除地址失败：" + e.getMessage());
        }
        if (result > 0) System.out.println("删除地址成功");
    }

    @Override
    public void update(Address address) throws UpdateException {
        if (address == null || address.getId() == null) {
            throw new UpdateException("更新地址错误：地址为空/id为空");
        } else if (address.getNation() == null || address.getProvince() == null
                || address.getCity() == null || address.getDetails() == null) {
            throw new UpdateException("更新地址错误：国家/省份/城市/详细信息为空");
        } else if (address.getReceiver() == null || address.getReceiver().length() == 0) {
            throw new UpdateException("更新地址错误：收货人为空");
        } else if (StringFormatUtil.isPhoneNum(address.getTel())) {
            throw new UpdateException("更新地址错误：联系电话为空/格式不正确");
        }

        int result;
        try {
            result = addressDao.update(address);
        } catch (Exception e) {
            System.out.println("更新地址失败");
            e.printStackTrace();
            throw new UpdateException("更新地址失败：" + e.getMessage());
        }
        if (result > 0) System.out.println("更新地址成功");
    }

    @Override
    public Address findOneById(Serializable id) {
        return addressDao.findOneById(id);
    }

    @Override
    public List<Address> findAll() {
        return addressDao.findAll();
    }
}
