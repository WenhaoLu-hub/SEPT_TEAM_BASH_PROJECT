package com.example.springbootbackend.controller;

import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("/{email}")
    public void resetPassword(@PathVariable String email){

    }

}
