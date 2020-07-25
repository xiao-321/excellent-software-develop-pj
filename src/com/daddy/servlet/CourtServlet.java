package com.daddy.servlet;

import com.daddy.entity.Project;
import com.daddy.service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CourtServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = (String) req.getAttribute("title");
        ProjectService service=new ProjectService();
        Project one = service.getOne(title);
        List<Project> list = service.getList(null);
        req.setAttribute("one",one);
        req.setAttribute("list",list);
        req.getRequestDispatcher("court_travel_show.jsp").forward(req, resp);
    }
}
