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
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        //通过type判断是登录还是注册
        if (type.equals("1")) {//1：登录
            String name = req.getParameter("name");
            String pass = req.getParameter("pass");
            User user = new User(name,pass,null);
            User login = userService.login(user);

            PrintWriter out = resp.getWriter();
            if (login.getName() == null) {
                out.println("2");
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("user", login);
                out.println("1");
            }
        } else if (type.equals("2")){//2：注册
            String name = req.getParameter("name");
            String pass = req.getParameter("pass");
            String email = req.getParameter("email");
            PrintWriter out = resp.getWriter();
            User user = new User(name,pass, email);
            if (userService.register(user)){
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                out.println("1");
            }else {
                out.println("2");
            }
        }else {
            HttpSession session = req.getSession();
            session.setAttribute("user", null);
            System.out.println(session.getAttribute("user"));
            resp.sendRedirect("/index");
        }
    }
}
