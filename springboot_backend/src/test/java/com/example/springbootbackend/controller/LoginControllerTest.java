package com.example.springbootbackend.controller;

import com.example.springbootbackend.exception.UserNotExistException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@SpringBootTest
class LoginControllerTest {
    @Resource
    private LoginController loginController;
    @Resource
    private HttpServletRequest httpServletRequest;

    @Test
    void login() throws UserNotExistException {
        ParameterRequestWrapper request = new ParameterRequestWrapper(httpServletRequest);
        request.addParameter("email","wxn1023717264@163.com");
        request.addParameter("password","new");
        String token = loginController.login(request);
        System.out.println("token:"+token);
    }

    @Test
    void sendEmail(){
        ParameterRequestWrapper requestWrapper = new ParameterRequestWrapper(httpServletRequest);
        loginController.sendEmail("wxn1023717264@163.com",requestWrapper);
    }

    @Test
    void resetPassword(){
        ParameterRequestWrapper parameterRequestWrapper = new ParameterRequestWrapper(httpServletRequest);
        String verifyCode = "vmjc67hvjkfuy";
        String newPassword = "new";
        loginController.resetPassword(parameterRequestWrapper,verifyCode,newPassword);
    }
    }
