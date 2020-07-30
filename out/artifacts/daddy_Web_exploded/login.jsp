<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Daddy travel agency</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>
<div class="content">
    <div id="loginDiv" class="form sign-in">
        <form id="LoginForm" method="post" action="JavaScript:;">
            <h2>Welcome back!</h2>
            <label>
                <span>Username</span>
                <input type="text" id="lname" name="name" required pattern="^[a-zA-Z0-9]{4,15}$"/>
            </label>
            <label>
                <span>Password</span>
                <input type="password" id="lpass" name="pass" required pattern="^[a-zA-Z0-9]{6,12}$"/>
            </label>
            <button type="submit" id="login" class="submit">Login in</button>
            <button type="button" class="fb-btn" onclick="location.href='/'">Back to home</button>
        </form>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>New to Daddy?</h2>
                <p>Creat a new account！</p>
            </div>
            <div class="img__text m--in">
                <h2>Already have an account？</h2>
                <p>Then register！</p>
            </div>
            <div class="img__btn">
                <span class="m--up">Register</span>
                <span class="m--in">Login</span>
            </div>
        </div>
        <div class="form sign-up">
            <form method="post" action="javaScript:;" id="RegisterForm">
                <h2>Register now</h2>
                <label>
                    <span>Username(length:4--15)</span>
                    <input type="text" id="rname" name="name" required pattern="^[a-zA-Z0-9]{4,15}$"/>
                </label>
                <label>
                    <span>Password(length:6-12)</span>
                    <input type="password" id="rpass" name="pass" required pattern="^[a-zA-Z0-9]{6,12}$"/>
                </label>
                <label>
                    <span>Email</span>
                    <input type="email" id="remail" name="email" required
                           pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"/>
                </label>
                <button type="submit" class="submit" id="register">Register</button>
                <button type="button" class="fb-btn" onclick="location.href='/'">Back to Home</button>
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
                    alert("Wrong Username or Password")
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
                    alert("Successfully register！");
                    location.href = "/index"
                } else {
                    alert("Unsuccessfully register,the Username has been used！");
                }
            },
            error: function (data) {
                console.log(data.state);
            }
        })
    })


</script>
</html>