package com.example.springbootbackend.controller;

import com.example.springbootbackend.exception.UserNotExistException;
import com.example.springbootbackend.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserProfileControllerTest {
    @Resource
    private UserProfileController userProfileController;

    @Resource
    private LoginController loginController;

    @Test
    void add() {
        User user = new User();
        user.setFirstName("Si");
        user.setLastName("fan");
        userProfileController.add(user);
    }

    @Test
    void delete() {
        Long id =2L;
        userProfileController.delete(id);
    }

    @Test
    void change() throws UserNotExistException {
        HttpServletRequest httpServletRequest = new MockHttpServletRequest();
        ParameterRequestWrapper request = new ParameterRequestWrapper(httpServletRequest);
        request.addParameter("email","wxn1023717264@163.com");
        request.addParameter("password","new");
        User user = new User();
        user.setFirstName("S");
        user.setLastName("fan");
        String token = loginController.login(request);
        // 模拟一个HttpServletRequest,放入token
        MockHttpServletRequest request1 = new MockHttpServletRequest();
        request1.addHeader("token",token);
        userProfileController.change(user,request1);
    }

}