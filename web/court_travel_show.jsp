<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.daddy.entity.Project" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>珍岛集团</title>
    <meta name="keywords" content="珍岛集团">
    <meta name="description" content="珍岛集团">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- include main css -->
    <link rel="stylesheet" type="text/css" href="css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/animate.css"/>

</head>
<body>

<div>
    <!--header-->
    <header class="header_zi">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo1.png" alt=""/></a>
            </div>
            <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
            <div class="logo_right">
                <nav class="nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                        <li><a href="court_travel_show.jsp" class="active">热门图片</a>
                            <ul>
                                <li><a href="court_travel_show.jsp">万林竹海</a></li>
                                <li><a href="court_travel_show.jsp">庐山瀑布</a></li>
                                <li><a href="court_travel_show.jsp">乐山大佛</a></li>
                            </ul>
                        </li>
                        <li><a href="comfortable.jsp">最新图片</a></li>
                    </ul>
                </nav>
                <div class="search">
		  	 	<span class="y_z">
		  	 		<a href="" class="zh active" style="margin-right: 30px">
              <button type="button" class="btn btn-default btn-sm">登录</button>
            </a>
            <a href="" class="en">
              <button type="button" class="btn btn-default btn-sm">注册</button>
            </a>
		  	 	</span>
                </div>
            </div>

        </div>
    </header>

    <!--banner  start-->
    <section class="banner_zi">
        <div><img src="images/banner_yuan.png" alt=""></div>

    </section>
    <!--banner end-->
    <div class="head_bar">
        <span>位置：</span><a href="index.jsp">首页 </a> > <span class="active">万林竹海</span>
    </div>
    <div class="travel_show">
        <div class="tra_con">
            <div class="top_t">万竹林海</div>
            <div class="top_2">
                风 <i>|</i> 景 <i>|</i> 图 <i>|</i> 集 <i>|</i> 阅 <i>|</i> 览
            </div>

            <div class="comfor_con">
                <div class="zx_fang">
                    <div class="f_da wow bounceIn">
                        <div style="max-height:300px;"><img src="${requestScope.one.img}" alt=""/>
                            <ul>
                                <li><span style="font-size: 25px;">${requestScope.one.title}</span></li>
                                <li><strong>[作者]</strong><span>${requestScope.one.author}</span></li>
                                <li><strong>[图片简介]</strong><span>${requestScope.one.introduction}</span></li>
                                <li><strong>[热度]</strong><span>${requestScope.one.heat}</span></li>
                                <li><strong>[国家]</strong><span>${requestScope.one.state}</span></li>
                                <li><strong>[城市]</strong><span>${requestScope.one.city}</span></li>
                                <li><strong>[发布时间]</strong><span>${requestScope.one.time}</span></li>
                                <span class="glyphicon glyphicon-star-empty icon-collection" aria-hidden="true">
        <button class="Collection">收藏</button>
      </span>
                                <span class="glyphicon glyphicon-star-empty icon-collection" aria-hidden="true"
                                      style="color: red">
        <button class="Collection">取消收藏</button>
      </span>
                            </ul>
                        </div>
                        <div><img src="images/fa_da2.jpg" alt=""/><i></i></div>
                        <div><img src="images/fa_da3.jpg" alt=""/><i></i></div>
                    </div>
                    <div class="f_xiao">
                        <c:forEach items="${requestScope.list}" var="pro" >
                            <div>
                                <a href="">
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
</script>

<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
</body>
</html>
