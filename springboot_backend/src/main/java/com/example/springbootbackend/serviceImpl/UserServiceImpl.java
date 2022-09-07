package com.example.springbootbackend.serviceImpl;

import com.example.springbootbackend.mapper.UserMapper;
import com.example.springbootbackend.model.User;
import com.example.springbootbackend.service.UserService;
import com.example.springbootbackend.utils.SnowFlakeUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
    public void delete(Long id) {
        userMapper.delete(id);
    }

    @Override
    public void change(User user) {
        userMapper.change(user);
    }

    @Override
    public Long login(String userName, String password) {
        return userMapper.login(userName,password);
    }
    // 发送邮件
    private JavaMailSender javaMailSender;
    public UserServiceImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }
    @Value("${spring.mail.username}")
    private String account;
    @Override
    public void sendEmail(String mailNumber) {
        String subject = "重置密码邮件";
        String text = "2333";
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(account);
        simpleMailMessage.setTo(mailNumber);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(text);
        javaMailSender.send(simpleMailMessage);
    }

}
