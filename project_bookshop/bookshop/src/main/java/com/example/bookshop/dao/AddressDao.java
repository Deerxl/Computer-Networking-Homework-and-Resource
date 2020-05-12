package com.example.bookshop.dao;

import com.example.bookshop.domain.Address;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/22 0:43
 */
@Repository
public interface AddressDao extends BaseDao<Address> {
    @Insert("INSERT INTO address (id, nation, province, city, details, receiver, tel) " +
            "VALUES (#{id}, #{nation}, #{province}, #{city}, #{details}, #{receiver}, #{tel})")
    int add(Address address);

    @Delete("DELETE FROM address WHERE id = #{id}")
    int delete(Serializable id);

    @Update("UPDATE address SET " +
            "nation = #{nation}, province = #{province}, city = #{city}, " +
            "details = #{details}, receiver = #{receiver}, tel = #{tel} " +
            "WHERE id = #{id}")
    int update(Address address);

    @Select("SELECT * FROM address WHERE id = #{id}")
    Address findOneById(Serializable id);

    @Select("SELECT * FROM address")
    List<Address> findAll();
}
