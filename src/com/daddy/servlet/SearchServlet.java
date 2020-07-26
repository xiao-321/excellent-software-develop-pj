package com.daddy.servlet;

import com.daddy.service.ProjectService;
import com.daddy.utils.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = (String) req.getAttribute("search");
        String content = (String) req.getAttribute("content");
        String select = (String) req.getAttribute("select");
        Integer limit = (Integer) req.getAttribute("limit");
        Integer page = (Integer) req.getAttribute("page");

        Page p=new Page(limit,page);
        ProjectService projectService=new ProjectService();
        Page timeList = projectService.getTimeList(p, search, content, select);
        req.setAttribute("data",timeList);
        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }
}
