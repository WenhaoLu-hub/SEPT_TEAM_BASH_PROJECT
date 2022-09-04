package com.example.springbootbackend.controller;

import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("/add")
    public void add(@RequestBody User user){
        userService.add(user);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id){
        userService.delete(id);
    }

    @PutMapping("/change")
    public void change(@RequestBody User user){
        userService.change(user);
    }

    @GetMapping("")
    public String search(@RequestBody User user){
        return userService.search(user);
    }

}
