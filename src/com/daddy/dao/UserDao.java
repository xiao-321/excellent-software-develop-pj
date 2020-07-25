package com.daddy.dao;

import com.daddy.entity.User;
import com.daddy.utils.BaseDao;

public class UserDao {
    private BaseDao baseDao = new BaseDao();

    public User login(User user) {
        String sql = "select * from user where name=? and pass=?";
        return baseDao.queryOne(sql, User.class, user.getName(), user.getPass());
    }

    public boolean register(User user) {
        return baseDao.inUpDel("insert into user(name,pass,email) values (?,?,?)", user.getName(), user.getPass(), user.getEmail());
    }
}
