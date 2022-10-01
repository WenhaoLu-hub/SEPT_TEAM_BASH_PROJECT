package com.example.springbootbackend.service;

import com.example.springbootbackend.model.User;

import java.util.List;

public interface UserService {

    public User search(Long id);

    public void add(User user);
    public void delete(Long id);
    public void change(User user);

    Long login(String userName, String password);

    String sendEmail(String email);

    void resetPassword(String mailNumber, String newPassword);

    List<User> searchDoctors(String type);
}