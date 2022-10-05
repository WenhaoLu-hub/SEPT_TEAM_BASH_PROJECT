package com.example.springbootbackend.controller;


import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.AdminService;
import com.example.springbootbackend.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;

    @PostMapping("/add")
    public void add(@RequestBody User user){
        adminService.add(user);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id){
        adminService.delete(id);
    }

    @GetMapping("/doctors")
    public Object getDoctors(){
        List<User> doctors = adminService.getDoctors("doctor");
        Map<String, Object> back = new HashMap<String, Object>();
        back.put("code", 1);
        back.put("msg", "doctor list");
        back.put("doctors",doctors);
        return back;
    }
    @GetMapping("/patients")
    public Object getPatients(){
        List<User> doctors = adminService.getPatients("patient");
        Map<String, Object> back = new HashMap<String, Object>();
        back.put("code", 1);
        back.put("msg", "patient list");
        back.put("patient",doctors);
        return back;
    }

}
