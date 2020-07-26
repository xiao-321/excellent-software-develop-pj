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
    <title>Daddy旅行社</title>
    <meta name="keywords" content="Daddy旅行社">
    <meta name="description" content="Daddy旅行社">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- include main css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <!--  <link href="font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' media="all"/>-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-3.4.2.min.css">

</head>
<body>

<div>
    <!--header-->
    <header class="header home_p">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo1.png" alt=""/></a>
            </div>
            <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
            <div class="logo_right">
                <nav class="nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index" class="active">首页</a></li>
                        <li><a href="Court">热门图片</a></li>
                        <li><a href="comfortable.jsp">最新图片</a></li>
                    </ul>
                </nav>
                <div class="search">
                    <a href="Search">
            <span class="sea_x">
              <button type="button" class="btn btn-default icon-search btn-sm">
                <span class="glyphicon glyphicon-search " aria-hidden="true"></span> 搜索
              </button>
            </span>
                    </a>
                    <c:if test="${sessionScope.user == null}">
                        <a href="login.jsp">登录 | 注册</a>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                    <span class="y_z">
            <select name="sele" onchange="s_click(this)">
              <option value="javaScript:;">${sessionScope.user.name}</option>
              <option value="https://www.baidu.com">我的收藏</option>
              <option value="https://www.baidu.com">上传</option>
              <option value="https://www.baidu.com">我的图片</option>
              <option value="/login?type=5">退出登录</option>
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
                <span class="span1"><a href="Court">热门介绍</a></span><br/>
                <span class="span2">POPULAR INTRODUCTION</span>
            </div>
            <div class="xia_x">
                <span class="img"></span>
            </div>
        </div>
    </div>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <c:forEach items="${requestScope.projects}" var="project">
                <div class="swiper-slide wow bounceIn">
                    <a href="Court">
                        <img src="${project.img}" style="width: 380px;height: 270px"  alt="" class="vcenter"/>
                    </a>
                    <a href="Court" class="swiper-text">
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
        <div class="syzz">
            <div class="jqgk">
                <div class="contai">
                    <div class="top_tit">
                        <span class="span1"><a href="javaScript:;">所有分享</a></span><br/>
                        <span class="span2">LATEST UPLOAD</span>
                    </div>
                    <div class="xia_x">
                        <span class="img"></span>
                    </div>
                </div>
            </div>
            <div class="syzz-midden">
                <c:forEach items="${requestScope.newsProjects}" var="news">
                    <div class="father">
                        <div class="midden-img">
                            <div><a href="comfortable.jsp"><img style="width: 380px;height: 270px" src="${news.img}" alt=""></a>
                            </div>
                        </div>
                        <div class="middle-text">
                            <p>
                                    ${news.title}
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="xia_x">
            <span class="img"></span>
        </div>
    </div>
</div>
<!--syzz end-->


<!--footer  start-->
<footer class="footer">
    <div class="footer_con">
        <div class="con">
            <div class="nei">
                <div class="clear"></div>
                <div class="lian">
                    电话：<a href="tel:021-31265245">021-********</a><br/>
                    邮箱：<a href="mailto:Eason.wang@71360.com">***********@qq.com</a><br/>
                    手机：<a href="tel:189 1610 1908">18* **** ****</a><br/>
                    地址：**市**区**路**号<br/>
                    <span>
							<a href="http://www.71360.com/" target="_blank">
								<img src="images/yu.png" alt=""/>
							</a>

							<span class="er_a">
								<img src="images/er.png" alt="" class="one_img"/>
								****公众号
								<img src="images/erwei.png" alt="" class="er_img"/>
							</span>

						</span>
                </div>

            </div>
        </div>

    </div>
    <div class="copy">Copyright© 2016 版权所有：********公司</div>
</footer>
<nav id="mmenu">
    <ul>
        <li><a href="index.jsp" class="active">首页</a></li>
        <li><a href="Court">热门图片</a>
            <ul>
                <li><a href="Court">万竹林海</a></li>
                <li><a href="Court">庐山瀑布</a></li>
                <li><a href="Court">乐山大佛</a></li>
            </ul>
        </li>
        <li><a href="comfortable.jsp">最新图片</a></li>
    </ul>
</nav>
</div>

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
