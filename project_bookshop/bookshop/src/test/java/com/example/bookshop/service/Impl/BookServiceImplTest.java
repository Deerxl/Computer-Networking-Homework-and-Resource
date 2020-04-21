package com.example.bookshop.service.Impl;

import com.example.bookshop.domain.Book;
import com.example.bookshop.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author Alu
 * @date 2020/4/21 13:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class BookServiceImplTest {
    @Autowired
    private BookService bookService;

    @Test
    public void findSearchBooks() {
        int[] types = new int[] {3,4,5,6};
        String[] nations = new String[] {"中国", "美国"};
        String[] prices = new String[] {"0a20", "20a30"};
        String[] scores = new String[] {"8a9", "9a10"};
        String name = "平";
        System.out.println(bookService.findSearchBooks(types, nations, prices, scores, name));
    }

    @Test
    public void findBooksByNation() {
        String[] nations = new String[]{"中国", "美国", "英国"};
        List<Book> result = bookService.findBooksByNation(nations);
        System.out.println(result);
        System.out.println(result.size());
    }

    @Test
    public void findByLikeName() {
        String name = "平";
        System.out.println(bookService.findByLikeName(name));
    }

    @Test
    public void findByTypes() {
        int[] types = new int[] {3,4,5,6};
        List<Book> result = bookService.findByTypes(types);
        System.out.println(result);
        System.out.println(result.size());
    }
}