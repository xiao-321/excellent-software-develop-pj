package com.daddy.service;

import com.daddy.dao.UserDao;
import com.daddy.entity.User;

public class UserService {
    private UserDao userDao = new UserDao();

    public User login(User user) {
        return userDao.login(user);
    }

    public boolean register(User user) {
        return userDao.register(user);
    }
}
