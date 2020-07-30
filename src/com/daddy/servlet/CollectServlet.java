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

@WebServlet("/collect")
public class CollectServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();
    private CollectService collectService = new CollectService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Project project = projectService.getById(id);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String type = req.getParameter("type");
        if (type.equals("1")){
            if (collectService.insert(new Collect(0,user.getName(),project.getId()))){
                req.setAttribute("ct",1);
            }else {
                req.setAttribute("ct",0);
            }
            req.setAttribute("pro",project);
            req.getRequestDispatcher("detail.jsp").forward(req,resp);
        }else if (type.equals("2")){
            if (collectService.delete(collectService.verfiy(user.getName(),project.getId()).getCid())){
                req.setAttribute("ct",0);
            }else {
                req.setAttribute("ct",1);
            }
            req.setAttribute("pro",project);
            req.getRequestDispatcher("detail.jsp").forward(req,resp);
        }else if (type.equals("3")){
            collectService.delete(collectService.verfiy(user.getName(),project.getId()).getCid());
            req.getRequestDispatcher("/mineC").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
