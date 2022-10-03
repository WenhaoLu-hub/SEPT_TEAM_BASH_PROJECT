package com.example.springbootbackend.controller;

import com.example.springbootbackend.exception.UserNotExistException;
import org.mockito.Mock;
import org.springframework.mock.web.MockHttpServletRequest;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@SpringBootTest
public class BookControllerTest {
    @Resource
    private BookController bookController;

    @Resource
    private LoginController loginController;

    // 根据真实存在的用户生成一个token,type=0为医生，type=1为病人
    String getToken(int type) throws UserNotExistException {
        HttpServletRequest httpServletRequest = new MockHttpServletRequest();
        ParameterRequestWrapper request = new ParameterRequestWrapper(httpServletRequest);
        if(type==0) request.addParameter("email","wxn1023717264@163.com");
        else request.addParameter("email","tkkyyds@163.com");
        request.addParameter("password","new");
        return loginController.login(request);
    }

    @Test
    void book() throws ParseException, UserNotExistException {
        // 模拟一个HttpServletRequest,放入token
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader("token",getToken(1));

        bookController.book("2024-3-23 9:00:00","face to face",request);
    }

    @Test
    void getBookList() throws UserNotExistException {
        // 模拟一个HttpServletRequest,放入token
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader("token",getToken(1));

        bookController.getBookList(request);
    }

    @Test
    void addAvailability() throws UserNotExistException, ParseException {
        // 模拟一个HttpServletRequest,放入token
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader("token",getToken(0));

  //      bookController.addAvailability("2023-8-13",request);
    }
}
