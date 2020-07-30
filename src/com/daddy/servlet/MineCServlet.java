package com.daddy.servlet;

import com.daddy.entity.Collect;
import com.daddy.entity.Project;
import com.daddy.entity.User;
import com.daddy.service.CollectService;
import com.daddy.service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/mineC")
public class MineCServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();
    private CollectService collectService = new CollectService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Collect> collects = collectService.queryByName(user.getName());
        List<Project> projects = new ArrayList<>();
        if (collects.size() != 0){
            for (int i=0;i<collects.size();i++){
                projects.add(projectService.getById(collects.get(i).getOid()));
            }
        }
        System.err.println(projects);
        req.setAttribute("list",projects);
        req.getRequestDispatcher("mineC.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
