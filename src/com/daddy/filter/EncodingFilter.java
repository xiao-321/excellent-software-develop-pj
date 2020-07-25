package com.daddy.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EncodingFilter implements Filter {
    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain;charset=utf-8");

        HttpServletRequest req = (HttpServletRequest) request;
		EncodingRequest er = new EncodingRequest(req);
		chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {

    }
}
