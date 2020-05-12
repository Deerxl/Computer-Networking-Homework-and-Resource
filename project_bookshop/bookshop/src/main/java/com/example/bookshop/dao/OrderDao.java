package com.example.bookshop.dao;

import com.example.bookshop.domain.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/21 23:25
 */
@Repository
public interface OrderDao extends BaseDao<Order> {
    @Insert("INSERT INTO order (id, time, buyer, address, price) " +
            "VALUES (#{id}, #{time}, #{buyer}, #{address}, #{price})")
    int add(Order order);

    @Delete("DELETE FROM order WHERE id = #{id}")
    int delete(Serializable id);

    @Update("UPDATE order " +
            "SET time = #{time}, buyer = #{buyer}, address = #{address}, price = #{price} " +
            "WHERE id = #{id}")
    int update(Order order);

    @Select("SELECT * FROM order WHERE id = #{id}")
    Order findOneById(Serializable id);

    @Select("SELECT * FROM order")
    List<Order> findAll();
}
