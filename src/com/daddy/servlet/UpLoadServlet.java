package com.daddy.servlet;

import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/upload")
@MultipartConfig(
        maxFileSize = 1024*1024*2
)
public class UpLoadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("fileUpLoad");
//        获取上传的文件名
        String fileName = part.getSubmittedFileName();
        String contextPath = req.getSession().getServletContext().getRealPath("images");
        part.write(contextPath+"\\"+fileName);
        resp.setContentType("text/html;charset=UTF-8");
        Map<String,Object> res = new HashMap<>();
        res.put("data",1);
        res.put("url","/images/"+fileName);
        Writer writer = resp.getWriter();
        writer.write(JSON.toJSONString(res));
        writer.flush();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
