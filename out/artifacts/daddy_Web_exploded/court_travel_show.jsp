<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.daddy.entity.Project" %>
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
    <link rel="stylesheet" type="text/css" href="css/nav.css"/>
    <link rel="stylesheet" type="text/css" href="css/footer_other.css"/>

</head>
<body>

<div>
    <!--header-->
    <header class="header_zi">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img class="logo1" src="images/logo1.png" alt=""/></a>
            </div>
            <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
            <div class="logo_right">
                <nav class="nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/Court" class="active">Hottest</a></li>
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

    <!--banner end-->
    <div class="head_bar">
        <span>Location：</span><a href="${pageContext.request.contextPath}/index">Home </a> > <span class="active" style=" color:#00BBFF;">Hottest</span>
    </div>
    <div class="travel_show">
        <div class="tra_con">
            <div class="top_t" style=" color:#00BBFF;">Hottest Pictures</div>
            <div class="top_2">
                B <i>|</i> r <i>|</i> o <i>|</i> w <i>|</i> s <i>|</i> e
            </div>

            <div class="comfor_con">
                <div class="zx_fang">
                    <div class="f_da wow bounceIn">
                    <c:forEach items="${requestScope.list}" var="pro">
                            <div style="max-height:300px;"><img src="${pro.img}" alt=""/>
                                <ul>
                                    <li><span style="font-size: 25px;">${pro.title}</span></li>
                                    <li><strong>[Author]</strong><span>${pro.author}</span></li>
                                    <li><strong>[Introduction]</strong><span>${pro.introduction}</span></li>
                                    <li><strong>[Popularity]</strong><span>${pro.heat}</span></li>
                                    <li><strong>[Country]</strong><span>${pro.state}</span></li>
                                    <li><strong>[City]</strong><span>${pro.city}</span></li>
                                    <li><strong>[Time]</strong><span>${pro.time}</span></li>
                                </ul>
                            </div>
                    </c:forEach>
                    </div>
                    <div class="f_xiao">
                        <c:forEach items="${requestScope.list}" var="pro">
                            <div>
                                <a href="${pageContext.request.contextPath}/detail?id=${pro.id}">
                                    <div class="pic">
                                        <img src="<c:out value="${pro.img}"/>" alt=""/><i></i>
                                    </div>
                                    <c:out value="${pro.title}"/>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>


    </div>

    <!--footer  start-->
    <footer>
        <div class="copyright">
            Copyright © 2020 Lee.All rights reserved.ICP Record No.19302010006 Fudan
        </div>
    </footer>
    <!--footer  end-->

    <!--移动端  Mmenu-->
    <nav id="mmenu">
        <ul>
            <li><a href="index.jsp" class="active">首页</a></li>
            <li><a href="court_travel_show.jsp">热门图片</a>
                <ul>
                    <li><a href="court_travel_show.jsp">万竹林海</a></li>
                    <li><a href="court_travel_show.jsp">庐山瀑布</a></li>
                    <li><a href="court_travel_show.jsp">乐山大佛</a></li>
                </ul>
            </li>
            <li><a href="comfortable.jsp">最新图片</a></li>
        </ul>
    </nav>
</div>

<!--Include Js-->
<script src="js/jquery-3.3.1.js" type="text/javascript" charset="utf-8"></script>

<!--移动端导航-->
<script src="js/jquery.mmenu.all.min.js" type="text/javascript" charset="utf-8"></script>

<script src="js/public.js" type="text/javascript" charset="utf-8"></script>

<!--slick-->
<script src="js/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/wow.js" type="text/javascript" charset="utf-8"></script>

<!--placeholder-->
<script src="js/jquery.placeholder.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
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

<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
</body>
</html>
