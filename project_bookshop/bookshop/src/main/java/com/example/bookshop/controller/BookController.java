package com.example.bookshop.controller;

import com.example.bookshop.domain.Book;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.BookService;
import com.example.bookshop.util.ReturnMsgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController implements BaseController<Book>{
    @Autowired
    private BookService bookService;

    /**
     * 添加书籍 URL: /book/add
     * @param book 待添加的书籍
     * @return 返回ReturnMsgUtil对象，(state, message)
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ReturnMsgUtil add(Book book) {
        try {
            bookService.add(book);
            return new ReturnMsgUtil(successCode, "success");
        } catch (AddException e) {
            return new ReturnMsgUtil(failCode, e.getMessage());
        }
    }

    /**
     * 删除书籍 URL: /book/delete
     * @param id 待删除的书籍的id
     * @return 返回ReturnMsgUtil对象，(state, message)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public ReturnMsgUtil delete(@RequestParam(value = "id") Serializable id) {
        try {
            bookService.delete(id);
            return new ReturnMsgUtil(successCode, "success");
        } catch (DeleteException e) {
            return new ReturnMsgUtil(failCode, e.getMessage());
        }
    }

    /**
     * 更新书籍 URL: /book/update
     * @param book 待更新的书籍
     * @return 返回ReturnMsgUtil对象，(state, message)
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ReturnMsgUtil update(Book book) {
        try {
            bookService.update(book);
            return new ReturnMsgUtil(successCode, "success");
        } catch (UpdateException e) {
            return new ReturnMsgUtil(failCode, e.getMessage());
        }
    }

    /**
     * 根据id查找书籍 URL: /book/findOneById
     * @param id 要查找书籍的id
     * @return 需要查找的书籍
     */
    @RequestMapping(value = "/findOneById", method = RequestMethod.GET)
    public Book findOneById(@RequestParam("id") Serializable id) {
        return bookService.findOneById(id);
    }

    /**
     * 查找所有的书籍 URL: /book/findAll
     * @return 所有书籍的集合
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public List<Book> findAll() {
        return bookService.findAll();
    }

    /**
     * 根据书名查找书籍 URL: /book/findOneByName
     * @param name 书名
     * @return 要查找的书籍
     */
    @RequestMapping(value = "/findOneByName", method = RequestMethod.GET)
    public Book findOneByName(@RequestParam("name") String name) {
        return bookService.findOneByName(name);
    }

    /**
     * 查找价格在区间[price1, price2]的书籍  URL: /book/findPriceRangeIn
     * @param price1 最低价
     * @param price2 最高价
     * @return 价格在区间[price1, price2]的书籍集合
     */
    @RequestMapping(value = "/findPriceRangeIn", method = RequestMethod.GET)
    public List<Book> findPriceRangeIn(@RequestParam("price1") double price1, @RequestParam("price2") double price2) {
        return bookService.findPriceRangeIn(price1, price2);
    }

    /**
     * 查找所有的热门书籍  URL: /book/findHot
     * @return 所有热门书籍
     */
    @RequestMapping("/findHot")
    public List<Book> findHot() {
        return bookService.findHot();
    }

    /**
     * 查找某一类型的书籍 URL：/book/findByType
     * @param type 类型值
     * @return  书籍集合
     */
    @RequestMapping("/findByType")
    public List<Book> findBooksByType(@RequestParam("type") int type) {
        return bookService.findBooksByType(type);
    }
}
