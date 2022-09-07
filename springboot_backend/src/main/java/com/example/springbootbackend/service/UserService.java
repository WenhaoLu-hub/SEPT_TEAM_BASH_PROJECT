package com.example.springbootbackend.service;

import com.example.springbootbackend.model.User;

public interface UserService {

    public String search(User user);
    public void add(User user);
    public void delete(Long id);
    public void change(User user);

    String login(String userName, String password);
}