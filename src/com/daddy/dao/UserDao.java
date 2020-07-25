package com.daddy.dao;

import com.daddy.entity.User;
import com.daddy.utils.BaseDao;

public class UserDao {
     BaseDao baseDao=new BaseDao();

     public User login(User user){
         String sql="select * from user where name=? and pass=?";
         return baseDao.queryOne(sql, User.class, user.getName(), user.getPass());
     }
}
