package com.example.springbootbackend.controller;

import com.auth0.jwt.JWT;
import com.example.springbootbackend.exception.UserNotExistException;
import com.example.springbootbackend.mapper.BookMapper;
import com.example.springbootbackend.model.Book;
import com.example.springbootbackend.model.LoginState;
import com.example.springbootbackend.service.BookService;
import com.example.springbootbackend.utils.JWTUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController {
    @Resource
    private BookService bookService;

    @PostMapping("/addAvailability/{date}")
    public void addAvailability(@PathVariable String date,HttpServletRequest request) throws ParseException, UserNotExistException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = simpleDateFormat.parse(date);
        String token = request.getHeader(("token"));
        LoginState loginState = JWTUtil.generateLoginState(token);
        bookService.addAvailability(date1,loginState.getId());
    }

    @PostMapping("/{dateTime}/{type}")
    public void book(@PathVariable String dateTime, @PathVariable String type, HttpServletRequest request) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = simpleDateFormat.parse(dateTime);
        String token = request.getHeader("token");
        System.out.println(token);
        LoginState loginState = JWTUtil.generateLoginState(token);
        bookService.book(date1,type,loginState.getId());
    }

    @GetMapping("")
    public List<Book> getBookList(HttpServletRequest request){
        String token = request.getHeader("token");
        LoginState loginState =JWTUtil.generateLoginState(token);
        return bookService.getBookList(loginState.getId());
    }
}
