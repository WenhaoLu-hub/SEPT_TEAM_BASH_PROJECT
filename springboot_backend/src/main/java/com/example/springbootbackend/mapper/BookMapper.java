package com.example.springbootbackend.mapper;

import com.example.springbootbackend.model.Book;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface BookMapper {
    @Insert("insert into nd_appointment(patient_id,doctor_id,time,type) values (#{patient},#{id},#{date},#{type})")
    void insert(Long id, Long patient, Date date, String type);
    List<Date> checkSpareDate(Long doctorId);
    @Select("select id,time,description,comment from nd_appointment where patient_id=#{id}")
    List<Book> query(Long id);

    @Insert("insert into nd_doctor_availability(doctor_id,available_day) values(#{id},#{date1})")
    void addAvailability(Date date1, Long id);
}
