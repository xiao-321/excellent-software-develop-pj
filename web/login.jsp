<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Daddy旅行社-登录/注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>
<div class="content">
    <div id="loginDiv" class="form sign-in">
        <form id="LoginForm" method="post" action="JavaScript:;">
            <h2>欢迎回来</h2>
            <label>
                <span>用户名</span>
                <input type="text" id="lname" name="name" required pattern="^[a-zA-Z0-9]{4,15}$"/>
            </label>
            <label>
                <span>密码</span>
                <input type="password" id="lpass" name="pass" required pattern="^[a-zA-Z0-9]{6,12}$"/>
            </label>
            <button type="submit" id="login" class="submit">登 录</button>
            <button type="button" class="fb-btn" onclick="location.href='/'">返回主页</button>
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
            <form method="post" action="javaScript:;" id="RegisterForm">
                <h2>立即注册</h2>
                <label>
                    <span>用户名</span>
                    <input type="text" id="rname" name="name" required pattern="^[a-zA-Z0-9]{4,15}$"/>
                </label>
                <label>
                    <span>密码</span>
                    <input type="password" id="rpass" name="pass" required pattern="^[a-zA-Z0-9]{6,12}$"/>
                </label>
                <label>
                    <span>电子邮箱</span>
                    <input type="email" id="remail" name="email" required
                           pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"/>
                </label>
                <button type="submit" class="submit" id="register">注 册</button>
                <button type="button" class="fb-btn" onclick="location.href='/'">返回主页</button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/script.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/md5.js" type="text/javascript"></script>
<script>
    $('#LoginForm').submit(function () {
        var uname = $('#lname').val();
        var upass = hex_md5($('#lpass').val());
        $.ajax({
            url: '/login',
            type: 'post',
            data: {name: uname, pass: upass, type: 1},
            success: function (data) {
                if (data == 1) {
                    location.href = "/index"
                } else {
                    alert("用户名或密码错误")
                }
            },
            error: function (data) {
                console.log(data.state);
            }
        })
    })
    $('#RegisterForm').submit(function () {
        var uname = $('#rname').val();
        var upass = hex_md5($('#rpass').val());
        var email = $('#remail').val();
        $.ajax({
            url: '/login',
            type: 'post',
            data: {name: uname, pass: upass, email: email, type: 2},
            success: function (data) {
                if (data == 1) {
                    alert("注册成功！");
                    location.href = "/index"
                } else {
                    alert("注册失败，用户已存在或账号不符合要求！");
                }
            },
            error: function (data) {
                console.log(data.state);
            }
        })
    })


</script>
</html>