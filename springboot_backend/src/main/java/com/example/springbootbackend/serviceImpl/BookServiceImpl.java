package com.example.springbootbackend.serviceImpl;

import com.example.springbootbackend.exception.UserNotExistException;
import com.example.springbootbackend.mapper.BookMapper;
import com.example.springbootbackend.mapper.UserMapper;
import com.example.springbootbackend.model.Book;
import com.example.springbootbackend.service.BookService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {
    @Resource
    private BookMapper bookMapper;
    @Resource
    private UserMapper userMapper;
    @Override
    public void book(Date date, Long id) {
        Long doctorId = userMapper.getMyDoctor(id);
        bookMapper.insert(doctorId,id,date);
    }

    @Override
    public List<Date> checkSpareDate(Long id) {
        return null;
    }

    @Override
    public List<Book> getBookList(Long id) {
        return bookMapper.query(id);
    }

    @Override
    public void addAvailability(Date date1, Long id) throws UserNotExistException {
        String type =  userMapper.getType(id);
        if(!type.equals("doctor")) throw new UserNotExistException("Doctor not exists");
        bookMapper.addAvailability(date1,id);
    }
}
