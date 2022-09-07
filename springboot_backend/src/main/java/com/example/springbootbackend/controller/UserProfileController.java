package com.example.springbootbackend.controller;

import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserProfileController {

    @Resource
    private UserService userService;
    @Resource
    //拿session里数据要先注入依赖
    private HttpServletRequest request;

    @PostMapping("/add")
    public void add(@RequestBody User user){
        userService.add(user);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id){
        userService.delete(id);
    }

    @PutMapping("/change")
    public void change(@RequestBody User user) {
        //拿session里的数据，先getSession再getAttribute
        Long userId = (Long) request.getSession().getAttribute("userId");
        user.setId(userId);
        System.out.println(userId);
        userService.change(user);
    }

    @GetMapping("")
    public String search(@RequestBody User user){
        return userService.search(user);
    }

}
