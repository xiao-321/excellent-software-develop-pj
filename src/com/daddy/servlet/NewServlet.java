package com.daddy.servlet;

import com.daddy.entity.Project;
import com.daddy.entity.QCMax;
import com.daddy.service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/new")
public class NewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProjectService service = new ProjectService();
        List<Project> projects = service.getList();
        req.setAttribute("list",projects);
        req.getRequestDispatcher("comfortable.jsp").forward(req, resp);
    }
}
