package com.example.springbootbackend.exception;

public class UserNotExistException extends Exception{
    private static final long serialVersionUID = 1L;
    public UserNotExistException(){};
    public UserNotExistException(String message){
        super(message);
    }
}
