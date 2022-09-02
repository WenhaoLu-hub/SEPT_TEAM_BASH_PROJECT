package com.example.springbootbackend.dao;

import com.example.springbootbackend.model.User;
import org.springframework.stereotype.Service;

public interface UserDao {
    void add(User user);
    void delete(int id);
    void change(User user);
    String search(User user);
    void addHealthInformation(User user);

}
