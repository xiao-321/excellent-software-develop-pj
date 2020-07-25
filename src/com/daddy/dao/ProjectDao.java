package com.daddy.dao;

import com.daddy.entity.Project;
import com.daddy.utils.BaseDao;
import com.daddy.utils.Page;

import java.util.List;

public class ProjectDao {
    BaseDao baseDao=new BaseDao();
    public List<Project> getList(Page page){
        String sql="select * from project limit ?,?";
        return baseDao.querySome(sql,Project.class,page.getSize(),page.getLimit());
    }
}
