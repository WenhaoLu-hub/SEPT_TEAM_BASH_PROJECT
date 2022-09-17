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

    @PostMapping("/register")
    public Object register(@RequestBody User user) {
        Map<String, Object> back = new HashMap<String, Object>();
        if(user== null) {
            back.put("code", 0);
            back.put("msg", "user can't be empty");
            return back;
        }
        if(StringUtil.isEmpty(user.getEmail()) || StringUtil.isEmpty(user.getPassword())) {
            back.put("code", 0);
            back.put("msg", "email or password can not be empty");
            return back;
        }
        user.setId(SnowFlakeUtil.getSnowFlakeId());
        userService.add(user);
        back.put("code", 1);
        back.put("msg", "signup success");
        return back;
    }
}