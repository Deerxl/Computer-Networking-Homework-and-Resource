package com.example.bookshop.service;

import com.example.bookshop.domain.Book;
import com.example.bookshop.exception.AddException;
import com.example.bookshop.exception.DeleteException;
import com.example.bookshop.exception.SelectException;
import com.example.bookshop.exception.UpdateException;

import java.io.Serializable;
import java.util.List;

public interface BookService extends BaseService<Book> {
    void add(Book book) throws AddException;

    void delete(Book book) throws DeleteException;

    void update(Book book) throws UpdateException;

    Book findOneById(Serializable id);

    List<Book> findAll();

    Book findOneByName(String name);

    List<Book> findPriceRangeIn(double price1, double price2) throws SelectException;

    List<Book> findHot();
}
