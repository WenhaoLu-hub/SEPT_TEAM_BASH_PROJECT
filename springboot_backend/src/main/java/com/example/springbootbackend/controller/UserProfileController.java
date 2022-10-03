package com.example.springbootbackend.controller;

import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.springbootbackend.model.LoginState;
import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import com.example.springbootbackend.utils.JWTUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserProfileController {

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
    public void change(@RequestBody User user,HttpServletRequest request) {
        String token = request.getHeader("token");
        System.out.println(token);
        LoginState loginState = JWTUtil.generateLoginState(token);
        Long userId = loginState.getId();
        user.setId(userId);
        System.out.println("userId:"+userId);
        userService.change(user);
    }
}
