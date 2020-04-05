package com.example.bookshop.controller;

import com.example.bookshop.domain.Book;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.SelectException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.Serializable;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    /**
     * 添加书籍 URL: /book/add
     * @param book 待添加的书籍
     */
    @RequestMapping("/add")
    public void add(Book book) throws AddException {
        bookService.add(book);
    }

    /**
     * 删除书籍 URL: /book/delete
     * @param book 待删除的书籍
     */
    @RequestMapping("/delete")
    public void delete(Book book) throws DeleteException {
        bookService.delete(book);
    }

    /**
     * 更新书籍 URL: /book/update
     * @param book 待更新的书籍
     */
    @RequestMapping("/update")
    public void update(Book book) throws UpdateException {
        bookService.update(book);
    }

    /**
     * 根据id查找书籍 URL: /book/findOneById
     * @param id 要查找书籍的id
     * @return 需要查找的书籍
     */
    @RequestMapping("/findOneById")
    public Book findOneById(Serializable id) {
        return bookService.findOneById(id);
    }

    /**
     * 查找所有的书籍 URL: /book/findAll
     * @return 所有书籍的集合
     */
    @RequestMapping("/findAll")
    public List<Book> findAll() {
        return bookService.findAll();
    }

    /**
     * 根据书名查找书籍 URL: /book/findOneByName
     * @param name 书名
     * @return 要查找的书籍
     */
    @RequestMapping("/findOneByName")
    public Book findOneByName(String name) {
        return bookService.findOneByName(name);
    }

    /**
     * 查找价格在区间[price1, price2]的书籍  URL: /book/findPriceRangeIn
     * @param price1 最低价
     * @param price2 最高价
     * @return 价格在区间[price1, price2]的书籍集合
     */
    @RequestMapping("/findPriceRangeIn")
    public List<Book> findPriceRangeIn(double price1, double price2) throws SelectException {
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
}
