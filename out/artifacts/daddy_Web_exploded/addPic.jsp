<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Daddy travel agency</title>
    <meta name="keywords" content="Daddy旅行社">
    <meta name="description" content="Daddy旅行社">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- include main css -->
    <link rel="stylesheet" type="text/css" href="css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="css/addPic.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" type="text/css" href="css/footer_other.css"/>

</head>
<body>

<div>
    <!--header-->
    <header class="header home_p" style="position: inherit">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img class="logo1" src="images/logo1.png" alt=""/></a>
            </div>
            <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
            <div class="logo_right">
                <nav class="nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/Court">Hottest</a></li>
                        <li><a href="${pageContext.request.contextPath}/new">Latest</a></li>
                    </ul>
                </nav>
                <div class="search">
                    <c:if test="${sessionScope.user == null}">
                <span class="y_z">
		  	 		<a href="login.jsp" class="zh active" style="margin-right: 30px">
                        <button type="button" class="btn btn-default btn-sm"
                                onclick="location.href='login.jsp'">Login</button>
                    </a>
                    <a href="login.jsp" class="en">
                        <button type="button" class="btn btn-default btn-sm"
                                onclick="location.href='login.jsp'">Register</button>
                    </a>
		  	 	</span>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                    <span class="y_z">
            <select name="sele" onchange="s_click(this)" style="width: 100px;display: inline-block;margin-bottom: 10px">
              <option value="javaScript:;">${sessionScope.user.name}</option>
                <option value="/addPic.jsp">Share</option>
              <option value="/mineC">My favor</option>
              <option value="/minePic">My sharing</option>
              <option value="/login?type=5">Log out</option>
            </select>
          </span>
                    </c:if>
                </div>
            </div>
        </div>
    </header>
    <!--header-->
    <div id="search">
        <form id="addform" action="javaScript:;" style="height: 565px;background-color: #E8E8E8;">
            Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input style="margin-left: 29px" name="title" type="text" placeholder="input something" required>
            Picture：<input id="file_upload" type="file"><br>
            Author：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input style="margin-left: 16px" name="author" type="text" placeholder="input something" required><br>
            Theme：  &nbsp;&nbsp;&nbsp;&nbsp; <input style="margin-left: 16px" name="theme" type="text" placeholder="input something" required><br>
            Heat：    &nbsp;  <input style="margin-left: 45px" name="heat" type="number" placeholder="input something" required><br>
            Country:<input style="margin-left: 45px" name="state" type="text" placeholder="input something" required><br>
            City：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      <input style="margin-left: 15px;" type="text" name="city" placeholder="input something" required><br>
            Content：&nbsp;&nbsp;&nbsp;&nbsp;<textarea style="margin-left: 15px;" name="introduction" type="text" placeholder="input something"
                           required></textarea>
            <input style="margin-left: 15px;" type="text" name="img" id="img" required hidden><br>
            <img id="preview" src="" alt="try to upload a picture">
            <button style="margin-left: 5%;margin-top: 20px;width:80px;height: 34px; border-radius: 17px;border:none;outline: none">
                Upload
            </button>
            <button style="margin-left: 18%;margin-top: 20px;width:80px;height: 34px; border-radius: 17px;border:none;outline: none;"
                    type="reset">Reset
            </button>
        </form>
    </div>

</div>
<!--syzz end-->


<!--footer  start-->
<footer style="margin-top: 600px ">
    <div class="copyright">
        Copyright © 2020 Lee.All rights reserved.ICP Record No.19302010006 Fudan
    </div>
</footer>

<!--Include Js-->
<script src="js/jquery-3.3.1.js" type="text/javascript" charset="utf-8"></script>


<!--slick-->
<script src="js/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/wow.js" type="text/javascript" charset="utf-8"></script>

<!--placeholder-->
<script src="js/jquery.placeholder.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
    });
</script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function () {
        $("#file_upload").change(function () {
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            var $img = $("#preview");

            if (fileObj && fileObj.files && fileObj.files[0]) {
                dataURL = windowURL.createObjectURL(fileObj.files[0]);
                $img.attr('src', dataURL);
            } else {
                dataURL = $file.val();
                var imgObj = document.getElementById("preview");
                imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
            }
            var file_upload = $('#file_upload')[0].files[0];
            var formdata = new FormData();
            formdata.append("fileUpLoad", file_upload);
            $.ajax({
                url: "/upload",
                type: 'post',
                data: formdata,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    var json = JSON.parse(data);
                    $('#img').val(json.url);
                }, error: function (data) {
                    console.log(data.status);
                }
            })
        });
    });
    $('#addform').submit(function () {
        $.ajax({
            url: "/addPic",
            type: 'post',
            data: $('#addform').serialize(),
            success: function (data) {
                alert(data);
                window.location.href = "/index";
            }, error: function (data) {
                console.log(data.status);
            }
        })
    });
    function s_click(obj) {
        var num = 0;
        for (var i = 0; i < obj.options.length; i++) {
            if (obj.options[i].selected === true) {
                num++;
            }
        }
        if (num === 1) {
            var url = obj.options[obj.selectedIndex].value;
            window.location.href = url;
        }
    }
</script>
</body>
</html>
