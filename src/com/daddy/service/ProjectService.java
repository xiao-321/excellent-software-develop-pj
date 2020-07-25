package com.daddy.service;

import com.daddy.dao.ProjectDao;
import com.daddy.entity.Project;
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

}
