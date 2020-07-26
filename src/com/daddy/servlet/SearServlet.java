package com.daddy.servlet;

import com.alibaba.fastjson.JSONObject;
import com.daddy.service.ProjectService;
import com.daddy.utils.Page;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class SearServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletInputStream inputStream = req.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
        String line = "";
        StringBuilder sb = new StringBuilder();
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        JSONObject object=JSONObject.parseObject(sb.toString());
        String search =  object.getString("search");
        String content = object.getString("content");
        String select = object.getString("select");
        Integer limit = object.getInteger("limit");
        Integer page = object.getInteger("page");
        Page p=new Page(limit,page);
        ProjectService projectService=new ProjectService();
        Page timeList = projectService.getTimeList(p, search, content, select);
        req.setAttribute("data",timeList);
        PrintWriter writer = resp.getWriter();
        String jsonObject = JSONObject.toJSONString(timeList);
        writer.println(jsonObject);
    }
}
