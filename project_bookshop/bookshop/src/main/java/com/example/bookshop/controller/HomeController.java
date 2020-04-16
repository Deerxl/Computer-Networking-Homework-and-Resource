package com.example.bookshop.controller;

import com.example.bookshop.domain.Book;
import com.example.bookshop.service.BookService;
import com.example.bookshop.service.UserService;
import com.example.bookshop.util.ReturnMsgUtil;
import com.example.bookshop.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alu
 * @date 2020/4/9 10:54
 */
@RestController
public class HomeController {
    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    private static int successCode = 0;
    private static int failCode = 1;

    /**
     * 登录
     * @param id id
     * @param password 密码
     * @return 成功返回0，失败返回1
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ReturnMsgUtil login(@RequestParam(value = "id") Serializable id,
                               @RequestParam(value = "password") String password) {
        try {
            userService.login(id, password);
        } catch (Exception e) {
            return new ReturnMsgUtil(failCode, e.getMessage());
        }
        return new ReturnMsgUtil(successCode, String.valueOf(SecurityUtil.getAuthority()));
    }

    /**
     * 首页书籍清单
     * @return 书籍清单
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView getHomeBookList() {
        ModelAndView modelAndView = new ModelAndView("/index");
        //轮播视图 返回五本书
        modelAndView.addObject("carousel", bookService.getCarouselBooks());
        //畅销排行
        modelAndView.addObject("rank", bookService.getBestseller());
        //热门/猜你喜欢
        modelAndView.addObject("hot", bookService.getHighScoreBooks(0));
        //各类别书籍
        modelAndView.addObject("type", bookService.getBooksByType());

        return modelAndView;
    }

    /**
     * 首页-换一批，获取另外四本书籍
     * @param index 批次，用来避免重复
     * @return 另外四本书籍
     */
    @RequestMapping(value = "/index/another", method = RequestMethod.GET)
    public List<Book> getAnotherFourBooks(int index) {
        return bookService.getHighScoreBooks(index);
    }
}
