package com.daddy.servlet;

import com.daddy.service.ProjectService;
import com.daddy.utils.Page;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SearServlet extends HttpServlet {
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
        PrintWriter writer = resp.getWriter();
        JSONObject jsonObject=new JSONObject(timeList);
        System.out.println(jsonObject);
        writer.println(jsonObject);
    }
}
