package com.example.springbootbackend.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("/login")
    public String login(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        return email;
    }

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
