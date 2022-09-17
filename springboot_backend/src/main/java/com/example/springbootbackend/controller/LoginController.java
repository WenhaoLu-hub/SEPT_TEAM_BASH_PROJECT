package com.example.springbootbackend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import com.example.springbootbackend.utils.SnowFlakeUtil;
import com.github.pagehelper.util.StringUtil;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Resource
    private UserService userService;


}