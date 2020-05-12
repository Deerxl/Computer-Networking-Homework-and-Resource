package com.example.bookshop.dao;

import com.example.bookshop.domain.Address;
import com.example.bookshop.domain.BuyerAddress;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/22 14:01
 */
@Repository
public interface BuyerAddressDao extends BaseDao<BuyerAddress> {
    @Insert("INSERT IGNORE INTO buyer_address (`buyer`, `address`, `isDefault`) " +
            "VALUES (#{buyer}, #{address}, #{isDefault})")
    int add(BuyerAddress buyer_address);

    @Delete("DELETE FROM buyer_address WHERE buyer = #{buyer} AND address = #{address}")
    int delete(Serializable buyer, Serializable address);

    @Update("UPDATE buyer_address " +
            "SET isDefault = #{isDefault} WHERE buyer = #{buyer} AND address = #{address}")
    int updateIsDefault(BuyerAddress buyerAddress);

    @Select("SELECT * FROM buyer_address WHERE buyer = #{buyerId}")
    BuyerAddress findByBuyer(Serializable buyerId);

    @Select("SELECT * FROM buyer_address")
    List<BuyerAddress> findAll();

    /**
     * 根据用户id查找买家的所有收获地址
     * @param buyerId 用户id
     * @return 此用户的所有收货地址
     */
    @Select("SELECT address.* FROM buyer_address, address WHERE buyer_address.buyer = #{buyerId}")
    List<Address> findAddressByBuyer(Serializable buyerId);


}
