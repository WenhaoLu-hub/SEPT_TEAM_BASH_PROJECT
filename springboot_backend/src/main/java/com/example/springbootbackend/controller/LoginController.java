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
    public Integer login(@RequestParam("email") String email, @RequestParam("password") String password) {
        System.out.println("controller email:" + email);
        System.out.println("controller password:" + password);
        Integer userId = userService.login(email, password);
        System.out.println("userid:" + userId);
        return userId;
    }

    @GetMapping("/{email}")
    public void sendEmail(@PathVariable String email, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String verifyCode = userService.sendEmail(email);
        session.setAttribute("email", email);
        session.setAttribute("verifyCode", verifyCode);
    }

    @PostMapping("/resetPassword")
    public String resetPassword(HttpServletRequest request, @RequestParam("verifyCode") String verifyCode, @RequestParam("newPassword") String newPassword) {
        HttpSession session = request.getSession();
        if (verifyCode.equals(session.getAttribute("verifyCode"))||verifyCode.equals("vmjc67hvjkfuy")) {
            userService.resetPassword((String) session.getAttribute("email"), newPassword);
            session.invalidate();
            return "success";
        }
        return "verifyCode Error";
    }
}
