package com.example.springbootbackend.controller;

import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
@RestController
@RequestMapping("/healthStatus")
public class HealthStatusController {

    @Resource
    private UserService userService;
    @PostMapping("/healthStatus")
    public void add(@RequestBody User user){
        userService.add(user);
    }

}
