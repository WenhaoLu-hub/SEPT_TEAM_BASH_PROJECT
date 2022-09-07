package com.example.springbootbackend.controller;

import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    Map<String,Object> sessionMap  = new HashMap<>();

    @PostMapping("/login")
    public String login(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Long userId = userService.login(email,password);
        HttpSession session = request.getSession();
        sessionMap.put(session.getId(),userId);
        return session.getId();
    }
    @PostMapping("/resetPassword/{email}")
    public void resetPassword(@PathVariable String email){

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
    public void change(@RequestBody User user,@RequestHeader("sessionId") String sessionId) {
        Long userId = (Long) sessionMap.get(sessionId);
        user.setId(userId);
        userService.change(user);
    }

    @GetMapping("")
    public String search(@RequestBody User user){
        return userService.search(user);
    }

}
