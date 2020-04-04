package com.example.bookshop.service.Impl;

import com.example.bookshop.dao.BookDao;
import com.example.bookshop.domain.Book;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.SelectException;
import com.example.bookshop.exception.UpdateException;
import com.example.bookshop.service.BookService;
import com.example.bookshop.util.StringFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookDao bookDao;

    @Override
    public void add(Book book) throws AddException {
        // TODO: 2020/4/5  检查图片路径、价格是否符合范围等条件
        if (book == null
        || StringFormatUtil.hasEmpty(book.getId())
        || StringFormatUtil.hasEmpty(book.getName())
        || StringFormatUtil.hasEmpty(book.getAuthor())
        || StringFormatUtil.isDouble(String.valueOf(book.getPrice()))) {
            throw new AddException("添加书籍错误：书籍id为空/id已被注册/书名含空/作者含空/价格含空/价格格式不正确");
        }

        int result = 0;
        try {
            result = bookDao.add(book);
        } catch (Exception e) {
            System.out.println("添加书籍失败");
            e.printStackTrace();
        }
        if (result > 0) System.out.println("添加书籍成功");
    }

    @Override
    public void delete(Book book) throws DeleteException {
        if (book == null)
            throw new DeleteException("删除书籍错误：书籍为空");

        int result = 0;
        try {
            result = bookDao.delete(book);
        } catch (Exception e) {
            System.out.println("删除书籍失败");
            e.printStackTrace();
        }
        if (result > 0) System.out.println("删除书籍成功");
    }

    @Override
    public void update(Book book) throws UpdateException {
        if (book == null)
            throw new UpdateException("更新书籍错误：书籍为空");

        int result = 0;
        try {
            result = bookDao.update(book);
        } catch (Exception e) {
            System.out.println("更新书籍失败");
            e.printStackTrace();
        }
        if (result > 0) System.out.println("更新书籍成功");
    }

    @Override
    public Book findOneById(Serializable id) {
        if (id == null) return null;
        return bookDao.findOneById(id);
    }

    @Override
    public List<Book> findAll() {
        return bookDao.findAll();
    }

    @Override
    public Book findOneByName(String name) {
        if (name == null) return null;

        return bookDao.findOneByName(name);
    }

    @Override
    public List<Book> findPriceRangeIn(float price1, float price2) throws SelectException {
        if (price1 > price2 || price1 < 0)
            throw new SelectException("查找出错：请检查价格范围");

        return bookDao.findPriceRangeIn(price1, price2);
    }

    @Override
    public List<Book> findHot() {
        return bookDao.findHot();
    }
}
