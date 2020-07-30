<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by IntelliJ IDEA.
User: ZSL_PC
Date: 2020/7/17
Time: 14:55
To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>


    <!--  <link href="font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' media="all"/>-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css"/>
</head>
<body>

<div>
    <!--header-->
    <header class="header home_p">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img class="logo1" src="images/logo1.png" alt=""/></a>
            </div>
            <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
            <div class="logo_right">
                <nav class="nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index" class="active change-button">Home</a></li>
                        <li><a class="change-button" href="${pageContext.request.contextPath}/Court">Hottest</a></li>
                        <li><a href="${pageContext.request.contextPath}/new">Latest</a></li>
                    </ul>
                </nav>
                <div class="search">
                    <a href="Search">
            <span class="sea_x">
              <button type="button" class="btn btn-default icon-search btn-sm">
                <span class="glyphicon " aria-hidden="true"></span>Search
              </button>
            </span>
                    </a>
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
              <option value="/addPic.jsp">Upload</option>
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

    <!--banner  start-->
    <section class="banner">
        <div><img src="images/banner1.jpg" alt=""></div>
    </section>
    <!--banner end-->
    <div class="jqgk">
        <div class="contai">
            <div class="top_tit">
                <h1><a href="Court" style=" color:#00BBFF; font-weight: bold;">POPULAR PHOTOS</a></h1><br/>
            </div>

        </div>
    </div>
    <div class="swiper-container" >
        <div class="swiper-wrapper">
            <c:forEach items="${requestScope.projects}" var="project">
                <div class="swiper-slide wow bounceIn">
                    <a href="${pageContext.request.contextPath}/detail?id=${project.id}">
                        <img src="${project.img}" style="width: 380px;height: 270px"  alt="" class="vcenter"/>
                    </a>
                    <a href="${pageContext.request.contextPath}/detail?id=${project.id}" class="swiper-text">
          <span class="glyphicon glyphicon glyphicon-fire " style="color: red" aria-hidden="true">
          </span>${project.title}
                    </a>
                </div>
            </c:forEach>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>

        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

    </div>
    <div class="wyzl">
        <!--wyzl end-->
        <div class="syzz" style="margin-top: 30px">
            <div class="jqgk" >
                <div class="contai" >
                    <div class="top_tit" >
                        <h1><a href="javaScript:;" style=" color:#00BBFF; font-weight: bold;">LATEST UPLOAD</a></h1><br/>
                    </div>

                </div>
            </div>
            <div class="syzz-midden" style="background-color: #E8E8E8">
                <c:forEach items="${requestScope.newsProjects}" var="news">
                    <div class="father">
                        <div class="midden-img">
                            <div><a href="${pageContext.request.contextPath}/detail?id=${news.id}"><img style="width: 380px;height: 270px" src="${news.img}" alt=""></a>
                            </div>
                        </div>
                        <div class="middle-text" style="position: relative;left: 50px;
    bottom: -17px;">
                            <p>
                                    ${news.title}
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div>
<!--syzz end-->


<!--footer  start-->
<footer style="margin-top: 30px">
    <div class="instructions">
        <div class="col">
            <ul>
                <li>
                    About us
                </li>
                <li>
                    Privacy Policy
                </li>
                <li>
                    Terms of Use
                </li>
            </ul>
        </div>
        <div class="col">
            <ul>
                <li>
                    FAQs
                </li>
                <li>
                    Contact
                </li>
            </ul>
        </div>
        <img id="vx" src="images/vx.jpg" alt="vx">
    </div>
    <div class="copyright">
        Copyright © 2020 Lee.All rights reserved.ICP Record No.19302010006 Fudan
    </div>
</footer>


<!--Include Js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript" charset="utf-8"></script>

<!--移动端导航-->
<script src="${pageContext.request.contextPath}/js/jquery.mmenu.all.min.js" type="text/javascript"
        charset="utf-8"></script>


<!--slick-->
<script src="${pageContext.request.contextPath}/js/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/wow.js" type="text/javascript" charset="utf-8"></script>

<!--placeholder-->
<script src="${pageContext.request.contextPath}/js/jquery.placeholder.min.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
    });
</script>
<script src="${pageContext.request.contextPath}/js/public.js" type="text/javascript" charset="utf-8"></script>
<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->

<script src="${pageContext.request.contextPath}/js/swiper-3.4.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/swiper-3.4.2.jquery.min.js"></script>

<script type="text/javascript">
    window.onload = function () {
    }
</script>

<script>
    var mySwiper = new Swiper('.swiper-container', {
        direction: 'horizontal',
        loop: true,

        // 如果需要分页器
        pagination: '.swiper-pagination',

        // 如果需要前进后退按钮
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',

        slidesPerView: 3,
        centeredSlides: true,
        autoplay: 2500
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
