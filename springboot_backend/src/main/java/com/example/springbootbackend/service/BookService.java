package com.example.springbootbackend.service;

import com.example.springbootbackend.model.Book;

import java.util.Date;
import java.util.List;

public interface BookService {
    void book(Date date,Long id);
    List<Date> checkSpareDate(Long id);
    List<Book> getBookList(Long id);
}
