package com.daddy.controller;

import com.daddy.entity.User;
import com.daddy.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class IndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = (String) req.getAttribute("name");
        String pass = (String) req.getAttribute("pass");
        User user=new User();
        user.setName(name);
        user.setPass(pass);
        UserService userService=new UserService();
        User login = userService.login(user);
        if (login==null) {
            resp.setCharacterEncoding("utf-8");
            PrintWriter writer = resp.getWriter();
            writer.println("用户名或密码错误");
            writer.flush();
        }else {
            HttpSession session = req.getSession();
            session.setAttribute("user",login);
            resp.sendRedirect("index.html");
        }
    }
}
