package com.example.springbootbackend.service;

import com.example.springbootbackend.model.User;

import java.util.List;

public interface AdminService {

    public void add(User user);
    public void delete(Long id);
    List<User> getDoctors(String type);
    List<User> getPatients(String type);

}
