package com.daddy.service;

import com.daddy.dao.ProjectDao;
import com.daddy.entity.Project;
import com.daddy.entity.QCMax;
import com.daddy.utils.Page;

import java.util.List;

public class ProjectService {
    ProjectDao projectDao=new ProjectDao();
    public List<Project> getList(Page page){
        List<Project> nowList;
        if (page==null){
            nowList = projectDao.getNowList();
        }else {
            nowList = projectDao.getList(page);
        }
       return nowList;
    }

    public Project getOne(String title){
        Project one=null;
        if (title==null) {
            one = projectDao.getOne();
        }else {
            one = projectDao.getOne(title);
        }
        return one;
    }

    public List<QCMax> getMax5() {
        return projectDao.getMax5();
    }
    public List<Project> getAll() {
        return projectDao.getAll();
    }

    public List<Project> getList() {
        return projectDao.getList();
    }

    public Project getById(int id) {
        return projectDao.getById(id);
    }
    public List<Project> getList3() {
        return projectDao.getList3();
    }


    public Page getTimeList(Page page,String title,String content,String text){
        if (title==null){
            List<Project> list = projectDao.getList(page);
            page.setData(list);
            return page;
        }
        if (content==null)
            content="title";
        if (text==null)
            text="time";
        return projectDao.getTimeList(page,title,content,text);
    }
}
