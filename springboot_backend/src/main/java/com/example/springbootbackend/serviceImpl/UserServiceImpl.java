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
import java.util.Random;

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
    public String sendEmail(String mailNumber) {
        String subject = "重置密码邮件";
        String code = generateVerifyCode();
        String text = "「重置密码」您的验证码是："+code;
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(account);
        simpleMailMessage.setTo(mailNumber);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(text);
        javaMailSender.send(simpleMailMessage);
        return code;
    }

    @Override
    public void resetPassword(String mailNumber, String newPassword) {
        userMapper.resetPassword(mailNumber,newPassword);
    }

    private String generateVerifyCode(){
        StringBuffer code = new StringBuffer();
        Random random = new Random();
        for(int i=0;i<4;i++){
            code.append(random.nextInt(10));
        }
        return code.toString();
    }
}
