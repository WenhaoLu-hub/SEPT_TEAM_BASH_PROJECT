package com.example.springbootbackend.mapper;

import com.example.springbootbackend.model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {
    @Insert("insert into nd_user(id,first_name,last_name,gender,age,phone_number,address) values(#{id},#{firstName},#{lastName},#{gender},#{age},#{phoneNumber},#{address})")
    void add(User user);
    @Delete("")
    void delete(int id);
    @Update("update nd_user set first_name=#{firstName},last_name=#{lastName},gender=#{gender},phone_number=#{phoneNumber},age=#{age},address=#[address}")
    void change(User user);

    String search(User user);

}
