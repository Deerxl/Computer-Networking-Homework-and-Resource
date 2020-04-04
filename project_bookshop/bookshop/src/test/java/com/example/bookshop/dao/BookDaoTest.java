package com.example.bookshop.dao;


import com.example.bookshop.domain.Book;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.time.Year;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class BookDaoTest {
    @Autowired
    private BookDao bookDao;

    @Test
    @Transactional
    public void add() {
        Book book = new Book();
        book.setId("0405testAddBook");
        book.setName("testAddBook");
        book.setAuthor("AddBook");
        book.setPrice(9999.9);

        int result = bookDao.add(book);
        if (result > 0) System.out.println("添加书籍成功");
    }

    @Test
    @Transactional
    public void delete() {
        Book book = new Book();
        book.setId("0405testDeleteBook");
        book.setName("testDeleteBook");
        book.setAuthor("DeleteBook");
        book.setPrice(9999.9);
        bookDao.add(book);

        int result = bookDao.delete(book);
        if (result > 0) System.out.println("删除书籍成功");
    }

    @Test
    @Transactional
    public void update() {
        Book book = new Book();
        book.setId("0405testDeleteBook");
        book.setName("testDeleteBook");
        book.setAuthor("DeleteBook");
        book.setPrice(9999.9);
        bookDao.add(book);

        book.setHot(1);
        book.setIntro("此人很懒，没有简介");
        book.setYear(Year.of(2020));
        book.setNation("中国");
        int result = bookDao.update(book);
        if (result > 0) System.out.println("更新书籍成功");
    }

    @Test
    @Transactional
    public void findOneById() {
        Book book = new Book();
        book.setId("0405testDeleteBook");
        book.setName("testDeleteBook");
        book.setAuthor("DeleteBook");
        book.setPrice(9999.9);
        bookDao.add(book);

        book.setImage("../../../image.jpg");
        book.setNation("中国");
        book.setScore(5);
        book.setType(1);
        book.setHot(1);
        book.setIntro("this one is lazy, and left nothing");
        int result = bookDao.update(book);
        if (result > 0) System.out.println("更新书籍成功");
    }

    @Test
    @Transactional
    public void findAll() {
        Book book = new Book();
        book.setId("0405testfindAll");
        book.setName("testfindAll");
        book.setAuthor("findAll");
        book.setPrice(9999.9);
        bookDao.add(book);

        Book book2 = new Book();
        book2.setId("0405testfindAll2");
        book2.setName("testfindAll2");
        book2.setAuthor("findAll2");
        book2.setPrice(9999.9);
        bookDao.add(book2);

        System.out.println(bookDao.findAll());
    }

    @Test
    @Transactional
    public void findOneByName() {
        Book book = new Book();
        book.setId("0405testfindOneByName");
        book.setName("testfindOneByName");
        book.setAuthor("findOneByName");
        book.setPrice(9999.9);
        bookDao.add(book);

        Book book2 = new Book();
        book2.setId("0405findOneByName2");
        book2.setName("findOneByName2");
        book2.setAuthor("findOneByName2");
        book2.setPrice(9999.9);
        bookDao.add(book2);

        System.out.println(bookDao.findOneByName("testfindAll"));
    }

    @Test
    @Transactional
    public void findPriceRangeIn() {
        Book book = new Book();
        book.setId("0405findPriceGreaterThan");
        book.setName("testfindPriceGreaterThan");
        book.setAuthor("findPriceGreaterThan");
        book.setPrice(999.9);
        bookDao.add(book);

        Book book2 = new Book();
        book2.setId("0405findPriceGreaterThan2");
        book2.setName("testfindPriceGreaterThan2");
        book2.setAuthor("findPriceGreaterThan2");
        book2.setPrice(9999.9);
        bookDao.add(book2);

        System.out.println(bookDao.findPriceRangeIn(999,9999));
    }

    @Test
    @Transactional
    public void findHot() {
        Book book = new Book();
        book.setId("0405findHot");
        book.setName("testfindHot");
        book.setAuthor("findHot");
        book.setPrice(999.9);
        book.setHot(1);
        bookDao.add(book);

        Book book2 = new Book();
        book2.setId("0405findHot2");
        book2.setName("testfindHot");
        book2.setAuthor("findHot");
        book2.setPrice(9999.9);
        book2.setHot(2);
        bookDao.add(book2);

        System.out.println(bookDao.findHot());
    }
}