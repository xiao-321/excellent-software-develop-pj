package com.daddy.servlet;

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

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();
    private CollectService collectService = new CollectService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Project project = projectService.getById(id);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null){
            int ct = 0;
            if (collectService.verfiy(user.getName(),project.getId()).getCid() != 0){
                ct = 1;
            }
            req.setAttribute("ct",ct);
        }
        req.setAttribute("pro",project);
        req.getRequestDispatcher("detail.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
