package com.daddy.servlet;

import com.daddy.entity.User;
import com.daddy.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String pass = req.getParameter("pass");
        String type = req.getParameter("type");
        //通过type判断是登录还是注册
        if (type.equals("1")) {//1：登录
            User user = new User();
            user.setName(name);
            user.setPass(pass);
            UserService userService = new UserService();
            User login = userService.login(user);
            if (login == null) {
                resp.setCharacterEncoding("utf-8");
                req.setAttribute("mess","用户名或密码错误！");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("user", login);
                resp.sendRedirect("index.jsp");
            }
        } else {//2：注册

        }

    }
}
