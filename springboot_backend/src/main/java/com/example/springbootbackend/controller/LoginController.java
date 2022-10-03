package com.example.springbootbackend.controller;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;

import com.example.springbootbackend.model.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.springbootbackend.service.UserService;
import com.example.springbootbackend.exception.UserNotExistException;
import com.example.springbootbackend.utils.JWTUtil;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/login")
public class LoginController {
    @Resource
    private UserService userService;

    @PostMapping("")
    public String login(HttpServletRequest request) throws UserNotExistException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email);
        System.out.println(password);
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
//        System.out.println("code:"+session.getAttribute("verifyCode"));
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

    @GetMapping("/user-detail")
    public Object getUser(@RequestParam long id) {
        User user = userService.search(id);
        System.out.println(user);
        Map<String, Object> back = new HashMap<String, Object>();
        if(user== null) {
            back.put("code", 0);
            back.put("msg", "user does not exist");
            return back;
        }
        back.put("code", 1);
        back.put("msg", "user found");
        back.put("user",user);
        return back;
    }
}