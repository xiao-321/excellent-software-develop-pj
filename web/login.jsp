<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by IntelliJ IDEA.
User: ZSL_PC
Date: 2020/7/17
Time: 14:55
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>监管管理-登录/注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>
<div class="content">
    <div id="loginDiv" class="form sign-in">
        <form id="LoginForm" method="post" action="${pageContext.request.contextPath}/login">
            <h2>欢迎回来</h2>
            <label>
                <span>用户名</span>
                <input type="text" name="name"/>.
            </label>
            <label>
                <span>密码</span>
                <input type="password" name="pass"/>
            </label>
            <input name="type" value="1" style="display: none">
            <button type="submit" id="login" class="submit">登 录</button>
            <button type="button" class="fb-btn" onclick="location.href='/'">返回主页</button>
            <c:if test="${mess != null}">
                <label>
                    <span style="color: red"><b>提 示</b></span><br>
                    <span style="color: red"><b>${mess}</b></span>
                </label>
            </c:if>
        </form>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>还未注册？</h2>
                <p>立即注册，发现大量机会！</p>
            </div>
            <div class="img__text m--in">
                <h2>已有帐号？</h2>
                <p>有帐号就登录吧，好久不见了！</p>
            </div>
            <div class="img__btn">
                <span class="m--up">注 册</span>
                <span class="m--in">登 录</span>
            </div>
        </div>
        <div class="form sign-up">
            <form method="post" action="${pageContext.request.contextPath}/login" id="RegisterForm">
                <h2>立即注册</h2>
                <label>
                    <span>用户名</span>
                    <input type="text" name="username"/>
                </label>
                <label>
                    <span>密码</span>
                    <input type="password" name="password"/>
                </label>
                <input style="display: none" name="type" value="2">
                <button type="submit" class="submit">注 册</button>
                <button type="button" class="fb-btn" onclick="location.href='/'">返回主页</button>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/script.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>

</body>

</html>