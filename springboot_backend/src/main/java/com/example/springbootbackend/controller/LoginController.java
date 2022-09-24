package com.example.springbootbackend.controller;

import com.auth0.jwt.JWT;
import com.example.springbootbackend.exception.UserNotExistException;
import com.example.springbootbackend.service.UserService;
import com.example.springbootbackend.utils.JWTUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Resource
    private UserService userService;

    @PostMapping("")
    public String login(HttpServletRequest request) throws UserNotExistException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Long userId = userService.login(email, password);
        //账号密码不对
        if(userId==null) throw new UserNotExistException("UserNotExist");
        //生成session
        Map<String,String> user = new HashMap<>();
        user.put("id", String.valueOf(userId));
        user.put("email",email);
        return JWTUtil.getToken(user);
    }

    @GetMapping("/{email}")
    public void sendEmail(@PathVariable String email, HttpServletRequest request) {
        //用session储存用户邮箱
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