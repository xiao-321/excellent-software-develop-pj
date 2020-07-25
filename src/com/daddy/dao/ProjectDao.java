package com.daddy.dao;

import com.daddy.entity.Project;
import com.daddy.entity.QCMax;
import com.daddy.utils.BaseDao;
import com.daddy.utils.Page;

import java.util.List;

public class ProjectDao {
    BaseDao baseDao = new BaseDao();

    public List<Project> getList(Page page) {
        String sql = "select * from project limit ?,?";
        return baseDao.querySome(sql, Project.class, page.getSize(), page.getLimit());
    }
    public List<Project> getNowList() {
        String sql = "select * from project order by time desc limit ?,?";
        return baseDao.querySome(sql, Project.class,0,4);
    }

    public Project getOne(String title) {
        String sql;
        Project project;
        sql = "select * from project where title = ?";
        project = baseDao.queryOne(sql, Project.class,title);
        return project;
    }
    public Project getOne() {
        String sql;
        Project project;
        sql = "select * from project limit 1";
        project = baseDao.queryOne(sql, Project.class);
        return project;
    }

    public List<QCMax> getMax5() {
        return baseDao.querySome("select oid,count(oid) from collect group by oid", QCMax.class);
    }

    public List<Project> getList() {
        return baseDao.querySome("select * from project order by id desc limit 0,5", Project.class);
    }

    public Project getById(int id) {
        return baseDao.queryOne("select * from project where id = ?", Project.class, id);
    }
    public List<Project> getList3() {
        return baseDao.querySome("select * from project order by id desc limit 0,3", Project.class);
    }

}
