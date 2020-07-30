package com.daddy.servlet;

import com.daddy.entity.Project;
import com.daddy.entity.QCMax;
import com.daddy.service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class IndexServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Project> projects = new ArrayList<>();
        List<QCMax> qcMaxes = projectService.getMax5();
        if (qcMaxes.size() < 5){
            projects = projectService.getList();
        }else {
            for (int i = 0;i < qcMaxes.size();i++){
                Project project = projectService.getById(qcMaxes.get(i).getOid());
                projects.add(project);
            }
        }
        req.setAttribute("projects",projects);
        req.setAttribute("newsProjects",projectService.getAll());
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
