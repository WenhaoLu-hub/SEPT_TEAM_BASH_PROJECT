package com.example.springbootbackend.controller;

import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Resource
    private UserService userService;

    @PostMapping("")
    public String login(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Long userId = userService.login(email,password);
        //生成session
        HttpSession session = request.getSession();
        //设置session里的数据
        session.setAttribute("userId",userId);
        return session.getId();
    }

    @GetMapping("/{email}")
    public void resetPassword(@PathVariable String email){
        userService.sendEmail(email);
    }

}
