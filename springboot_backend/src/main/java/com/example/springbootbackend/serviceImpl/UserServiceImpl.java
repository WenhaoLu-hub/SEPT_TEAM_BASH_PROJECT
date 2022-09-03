package com.example.springbootbackend.serviceImpl;

import com.example.springbootbackend.mapper.UserMapper;
import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import com.example.springbootbackend.utils.SnowFlakeUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public String search(User user) {
        return userMapper.search(user);
    }

    @Override
    public void add(User user) {
        user.setId(SnowFlakeUtil.getSnowFlakeId());
        userMapper.add(user);
    }

    @Override
    public void delete(int id) {
userMapper.delete(id);
    }

    @Override
    public void change(User user) {
userMapper.change(user);
    }

    @Override
    public void addHealthStatus(User user) {
        userMapper.add(user);
    }



}
