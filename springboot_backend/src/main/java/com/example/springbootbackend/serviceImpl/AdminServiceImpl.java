package com.example.springbootbackend.serviceImpl;

import com.example.springbootbackend.mapper.UserMapper;
import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Resource
    private UserMapper userMapper;

    @Override
    public void add(User user) {
        // 用当前时间+1位随机数的方式生成一个ID
        long nowTime = System.currentTimeMillis() / 1000;
        Integer nowTimeInt = Long.valueOf(nowTime).intValue();
        Random random = new Random();
        Long userId = Long.valueOf(nowTimeInt + random.nextInt(9));
        // 重新设置userId
        user.setId(userId);
        userMapper.add(user);
    }

    @Override
    public void delete(Long id) {
        userMapper.delete(id);
    }

    @Override
    public List<User> getDoctors(String type) {
        return userMapper.getDoctors(type);
    }

    @Override
    public List<User> getPatients(String type) {
        return userMapper.getPatient(type);
    }
}
