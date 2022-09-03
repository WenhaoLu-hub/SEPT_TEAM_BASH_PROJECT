package com.example.springbootbackend.serviceImpl;

import com.example.springbootbackend.dao.UserDao;
import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    //@Resource
    private UserDao userDao;
    @Override
    public String search(User user) {
        return userDao.search(user);
    }

    @Override
    public void add(User user) {
        userDao.add(user);
    }

    @Override
    public void delete(int id) {
userDao.delete(id);
    }

    @Override
    public void change(User user) {
userDao.change(user);
    }

}
