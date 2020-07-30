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

public class CourtServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProjectService service = new ProjectService();
        List<Project> projects = new ArrayList<>();
        List<QCMax> qcMaxes = service.getMax5();
        if (qcMaxes.size() < 5){
            projects = service.getList();
        }else {
            for (int i = 0;i < qcMaxes.size();i++){
                projects.add(service.getById(qcMaxes.get(i).getOid()));
            }
        }
        req.setAttribute("list",projects);
        req.getRequestDispatcher("court_travel_show.jsp").forward(req, resp);
    }
}
