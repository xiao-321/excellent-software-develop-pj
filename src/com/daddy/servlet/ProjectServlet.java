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
import java.util.List;

@WebServlet("/picEditor")
public class ProjectServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();
    private CollectService collectService = new CollectService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        if (type.equals("delete")){
            int id = Integer.parseInt(req.getParameter("id"));
            projectService.deleteById(id);
            collectService.deleteByOid(id);
        }
        if (type.equals("update")){
            int id = Integer.parseInt(req.getParameter("id"));
            Project project = projectService.getById(id);
            req.setAttribute("pro",project);
            req.getRequestDispatcher("updatePic.jsp").forward(req,resp);
        }else {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            List<Project> projects = projectService.getByUname(user.getName());
            req.setAttribute("list",projects);
            req.getRequestDispatcher("minePic.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
