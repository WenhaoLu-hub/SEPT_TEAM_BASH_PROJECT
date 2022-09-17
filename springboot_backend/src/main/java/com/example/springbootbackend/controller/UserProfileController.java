package com.example.springbootbackend.controller;

import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
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
        //Long userId = (Long) request.getSession().getAttribute("userId");
        String token = request.getHeader("token");
        System.out.println(token);
        DecodedJWT decodedJWT = JWTUtil.decode(token);
        Map<String, Claim> info = decodedJWT.getClaims();
        Claim c = info.get("id");
        String s = c.toString();
        String su = s.substring(1,s.length()-1);
        Long userId = Long.valueOf(su);
        user.setId(userId);
        System.out.println("userId:"+userId);
        userService.change(user);
    }

    //@GetMapping("")
    //public String search(@RequestBody User user){
    //   return userService.search(user);
    //}

}
