package com.daddy.service;

import com.daddy.dao.UserDao;
import com.daddy.entity.User;

public class UserService {
    UserDao userDao=new UserDao();
    public User login (User user){
        return userDao.login(user);
    }
}
