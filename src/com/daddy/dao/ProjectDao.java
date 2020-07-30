package com.daddy.dao;

import com.daddy.entity.Project;
import com.daddy.entity.QCMax;
import com.daddy.utils.BaseDao;
import com.daddy.utils.Page;
import com.daddy.utils.Utils;

import java.util.List;

public class ProjectDao {
    private BaseDao baseDao = new BaseDao();

    public List<Project> getList(Page page) {
        String sql = "select * from project limit ?,?";
        return baseDao.querySome(sql, Project.class, page.getSize(), page.getLimit());
    }

    public int getCount() {
        String sql = "select count(id) from project ";
        return baseDao.queryCount(sql);
    }

    public List<Project> getNowList() {
        String sql = "select * from project order by time desc limit ?,?";
        return baseDao.querySome(sql, Project.class, 0, 4);
    }

    public Project getOne(String title) {
        String sql;
        Project project;
        sql = "select * from project where title = ?";
        project = baseDao.queryOne(sql, Project.class, title);
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
        return baseDao.querySome("select oid,count(oid) as count from collect group by oid", QCMax.class);
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

    public Page getTitleList(Page page, String title, String content) {
        String sql = "select * from project where " + content + " like '%?%' limit ?,?";
        String count = "select count(id) from project where " + content + " like '%?%'";
        List<Project> projects = baseDao.querySome(sql, Project.class, title, page.getSize(), page.getLimit());
        int sum = baseDao.queryCount(count, title);
        page.setSum(sum);
        page.setData(projects);
        return page;
    }

    public Page getTimeList(Page page, String title, String content, String text) {
        String sql = "select * from project where " + content + " like '%" + title + "%' order by " + text + " desc limit ?,?";
        List<Project> projects = baseDao.querySome(sql, Project.class, page.getSize(), page.getLimit());
        String count = "select count(id) from project where " + content + " like '%" + title + "%'";
        int sum = baseDao.queryCount(count);
        page.setSum(sum);
        page.setData(projects);
        return page;
    }


    public List<Project> getAll() {
        return baseDao.querySome("select * from project order by id desc", Project.class);
    }

    public boolean insertPro(Project p) {
        return baseDao.inUpDel("insert into project (title,theme,author,introduction,heat,state,city,time,img) values (?,?,?,?,?,?,?,?,?)",
                p.getTitle(), p.getTheme(), p.getAuthor(), p.getIntroduction(), p.getHeat(), p.getState(), p.getCity(), Utils.dateToString(p.getTime()), p.getImg());
    }

    public boolean updatePro(Project p) {
        return baseDao.inUpDel("update project set title = ?,theme = ?,author = ?,introduction = ?,heat = ?,state = ?,city = ?,img = ? where id = ?",
                p.getTitle(), p.getTheme(), p.getAuthor(), p.getIntroduction(), p.getHeat(), p.getState(), p.getCity(), p.getImg(), p.getId());
    }

    public List<Project> getByUname(String uname) {
        return baseDao.querySome("select * from project where author = ?", Project.class, uname);
    }

    public boolean deleteById(int id) {
        return baseDao.inUpDel("delete from project where id = ?", id);
    }
}
