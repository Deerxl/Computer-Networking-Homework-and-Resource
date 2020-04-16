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
public interface BookDao extends BaseDao<Book> {
    /**
     * 添加书籍
     * @param book 待添加的书籍
     * @return 返回受影响的行数
     */
    @Insert("INSERT INTO book " +
            "(`id`, `name`, `author`, `price`, `press`, `image`, `type`, `score`, `intro`, `nation`, `year`) " +
            "VALUES " +
            "(#{id}, #{name}, #{author}, #{price}, #{press}, #{image}, " +
            "#{type}, #{score}, #{intro}, #{nation}, #{year})")
    int add(Book book);

    /**
     * 删除书籍
     * @param id 待删除的书籍的id
     * @return 返回受影响的行数
     */
    @Delete("DELETE FROM book WHERE id = #{id}")
    int delete(Serializable id);

    /**
     * 更新书籍
     * @param book  待更新的书籍
     * @return 返回受影响的行数
     */
    @Update("UPDATE book SET " +
            "name = #{name}, author = #{author}, price = #{price}, press = #{press}, image = #{image}, " +
            "type = #{type}, score = #{score}, intro = #{intro}, nation = #{nation}, year = #{year} " +
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
    List<Book> findPriceRangeIn(double price1, double price2);

    /**
     * 通过书籍类型查找书籍
     * @param type 书籍类型
     * @return 书籍集合
     */
    @Select("SELECT * FROM book WHERE type = #{type}")
    List<Book> findBooksByType(int type);

    @Select("SELECT MAX(id) FROM book")
    int findMaxId();

    /**
     * 首页轮播视图需要的书籍列表，需要id，name，image，intro，暂时选定为前四本书
     * @return 首页轮播视图需要的书籍
     */
    @Select("SELECT id, name, image, intro FROM book limit 4")
    List<Book> getCarouselBooks();

    /**
     * 首页热销书籍列表，十本书，需要id，name，image
     * @return 十本热销书籍
     */
    @Select("SELECT book.id, `name`, `image` FROM book, orderitem " +
            "WHERE book.id = orderitem.book " +
            "GROUP BY orderitem.book " +
            "ORDER BY SUM( count ) DESC LIMIT 10 ")
    List<Book> getBestseller();

    /**
     * 首页热门/猜你喜欢书籍列表-换一批，需要id，name，image，每次四本。为方便起见，按分数排序
     * @param index 换一批的批次记录，例如，1即分数排名5-8的四本书
     * @return 换一批的四本书
     */
    @Select("SELECT id, `name`, `image`, score FROM book ORDER BY score DESC LIMIT #{index}, 4")
    List<Book> getHighScoreBooks(int index);

    /**
     * 获取书籍总数
     * @return 书籍总数
     */
    @Select("SELECT COUNT(*) FROM book")
    int getBookCount();

    /**
     * 获取各类别书籍列表，根据评分选高分各4本，id，name，image
     * 有bug，即遇到相同分数时，会返回多余4本的书
     * @return 各类别书籍
     */
    @Select("SELECT id, `name`, `image`, type FROM book as a " +
            "WHERE (SELECT COUNT(DISTINCT id) FROM  book as b WHERE b.type = a.type AND b.score > a.score) < 4 " +
            "ORDER BY type, score DESC")
    List<Book> getBooksByType();


}
