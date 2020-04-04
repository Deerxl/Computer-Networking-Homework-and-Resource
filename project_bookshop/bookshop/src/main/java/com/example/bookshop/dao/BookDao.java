package com.example.bookshop.dao;

import com.example.bookshop.domain.Book;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface BookDao {
    /**
     * 添加书籍
     * @param book  待添加的书籍
     * @return  返回受影响的行数
     */
    @Insert("INSERT INTO book " +
            "(`id`, `name`, `author`, `image`, `price`, `type`, `score`, `intro`, `nation`, `year`, `hot`) " +
            "VALUES " +
            "(#{id}, #{name}, #{author}, #{image}, #{price}, #{type}, #{score}, #{intro}, #{nation}, #{year}, #{hot})")
    int add(Book book);

    /**
     * 删除书籍
     * @param book 待删除的书籍
     * @return 返回受影响的行数
     */
    @Delete("DELETE FROM book WHERE id = #{id}")
    int delete(Book book);

    /**
     * 更新书籍
     * @param book  待更新的书籍
     * @return 返回受影响的行数
     */
    @Update("UPDATE book SET " +
            "name = #{name}, author = #{author}, image = #{image}, price = #{price}, type = #{type}, score = #{score}, intro = #{intro}, nation = #{nation}, year = #{year}, hot = #{hot} " +
            "WHERE id = #{id}")
    int update(Book book);

    /**
     * 根据id查找书籍
     * @param id 待查找的书籍id
     * @return 待查找的书籍
     */
    @Select("SELECT * FROM book WHERE id = #{id}")
    Book findOneById(Serializable id);

    /**
     * 查找所有的书籍
     * @return 所有书籍集合
     */
    @Select("SELECT * FROM book")
    List<Book> findAll();

    /**
     * 根据书名查找书籍
     * @param name 书名
     * @return 待查找的书籍
     */
    @Select("SELECT * FROM book WHERE name = #{name}")
    Book findOneByName(String name);

    /**
     * 查找价格在区间[price1, price2]的书籍
     * @param price1 最低价
     * @param price2 最高价
     * @return 价格在区间[price1, price2]的书籍集合
     */
    @Select("SELECT * FROM book WHERE price >= #{price1} AND price <= #{price2}")
    List<Book> findPriceRangeIn(float price1, float price2);

    /**
     * 查找所有的热门书籍
     * @return 所有热门书籍
     */
    @Select("SELECT * FROM book WHERE hot = 2")
    List<Book> findHot();
}
