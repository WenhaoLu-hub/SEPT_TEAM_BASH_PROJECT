package com.example.springbootbackend.mapper;

import com.example.springbootbackend.model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {

    @Select("select type from nd_user where id=#{id}")
    String getType(Long id);
    @Select("select doctor_id from nd_user where id=#{id}")
    Long getMyDoctor(Long id);
    @Insert("insert into nd_user(id,email,password,type,firstName,lastName,gender,age,phoneNumber,address,doctor_id) values(#{id},#{email},#{password},#{type},#{firstName},#{lastName},#{gender},#{age},#{phoneNumber},#{address},#{doctor_id})")
    void add(User user);
    @Delete("delete from nd_user where id=#{id}")
    void delete(Long id);
    @Update("update nd_user set first_name=#{firstName},last_name=#{lastName},gender=#{gender},phone_number=#{phoneNumber},age=#{age},address=#{address} where id=#{id}")
    void change(User user);
    @Select("select * from nd_user where id=#{id}")
    User search(Long id);
    @Select("select id from nd_user where email=#{userName} and password=#{password}")
    Long login(String userName, String password);
    @Select("select * from nd_user where type=#{type}")
    List<User> getDoctors(String type);
    @Update("update nd_user set password=#{newPassword} where email=#{mailNumber}")
    void resetPassword(String mailNumber, String newPassword);

    @Select("select id from nd_user where firstName=#{firstName} and lastName=#{lastName}")
    Long getDoctorId(String firstName, String lastName);
}
