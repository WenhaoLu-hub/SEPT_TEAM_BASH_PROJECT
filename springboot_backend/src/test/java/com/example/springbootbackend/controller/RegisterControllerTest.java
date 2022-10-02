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
    void creatPatientAccount() {
        ParameterRequestWrapper request = new ParameterRequestWrapper(httpServletRequest);
        request.addParameter("email","123456789@123.com");
        request.addParameter("password","12345678");
        request.addParameter("type","patient")
        RegisterController.register(request);
    }

    @Test
    void creatDoctorAccount() {
        ParameterRequestWrapper request = new ParameterRequestWrapper(httpServletRequest);
        request.addParameter("email","123456789@123.com");
        request.addParameter("password","12345678");
        request.addParameter("type","doctor")
        RegisterController.register(request);
    }
