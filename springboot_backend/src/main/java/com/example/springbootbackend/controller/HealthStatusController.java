package com.example.springbootbackend.controller;

import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
public class HealthStatusController {
    @Resource
    private UserService userService;
    @GetMapping("/healthStatus")
    public void addHealthStatus(@RequestBody String status){
        userService.addHealthStatus(status);
    }

}
