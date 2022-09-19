package com.example.springbootbackend.controller;

import com.example.springbootbackend.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserProfileControllerTest {
    @Resource
    private UserProfileController userProfileController;

    @Test
    void add() {
        User user = new User();
        user.setFirstName("Si");
        user.setLastName("fan");
        userProfileController.add(user);
    }

    @Test
    void delete() {
        Long id =2L;
        userProfileController.delete(id);
    }

    @Test
    void change() {
        User user = new User();
        user.setFirstName("S");
        user.setLastName("fan");
//        userProfileController.change(user);
    }

}