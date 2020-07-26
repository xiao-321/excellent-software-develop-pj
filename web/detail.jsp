<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link rel="stylesheet" type="text/css" href="css/slick.css"/>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
  <link rel="stylesheet" type="text/css" href="css/jquery.mmenu.all.css"/>
  <link rel="stylesheet" type="text/css" href="css/style.css"/>
  <link href="font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' media="all"/>
  <link rel="stylesheet" type="text/css" href="css/animate.css"/>
  <style>
    .mask_bg {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-size: cover;
      z-index: -2;
      filter: blur(100px);
    }

    .mask {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      background: rgba(0, 0, 0, 0.2);
    }
  </style>

</head>
<body>

<div>
  <!--header-->
  <header class="header_zi">
    <div class="container">
      <div class="logo">
        <a href="index.html"><img src="images/logo1.png" alt=""/></a>
      </div>
      <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
      <div class="logo_right">
        <nav class="nav">
          <ul>
            <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/Court">热门图片</a></li>
            <li><a href="${pageContext.request.contextPath}/new">最新图片</a></li>
          </ul>
        </nav>
        <div class="search">
          <c:if test="${sessionScope.user == null}">
                <span class="y_z">
		  	 		<a href="login.jsp" class="zh active" style="margin-right: 30px">
                        <button type="button" class="btn btn-default btn-sm"
                                onclick="location.href='login.jsp'">登录</button>
                    </a>
                    <a href="login.jsp" class="en">
                        <button type="button" class="btn btn-default btn-sm"
                                onclick="location.href='login.jsp'">注册</button>
                    </a>
		  	 	</span>
          </c:if>
          <c:if test="${sessionScope.user != null}">
                    <span class="y_z">
            <select name="sele" onchange="s_click(this)" style="width: 100px;display: inline-block;margin-bottom: 10px">
              <option value="javaScript:;">${sessionScope.user.name}</option>
              <option value="addPic.jsp">分享图片</option>
              <option value="https://www.baidu.com">我的收藏</option>
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
  <section class="banner_zi">
    <!--<div><img src="images/comfortable.png" alt=""></div>-->
  </section>
  <!--banner end-->
  <div class="head_bar">
    <span>位置：</span><a href="${pageContext.request.contextPath}/index">首页 </a> > <span class="active">图片详情</span>
  </div>
  <div class="comfor_con">
    <div class="top_tit">
      <span class="span1"><a href="#">分享详情</a></span><br/>
      <span class="span2">Latest upload</span>
    </div>
    <div class="com_shi">
      <br>
    </div>
    <div class="zx_fang">
      <div class="f_da wow bounceIn" style="max-height:300px;height: 280px; overflow: hidden">
        <div><img src="${pro.img}"/>
          <ul style="font-size: 20px">
            <li><span class="text_shadow" style="font-size: 25px;">${pro.title}</span></li>
            <li><strong class="text_shadow">[作者]</strong><span class="text_shadow">${pro.author}</span></li>
            <li><strong class="text_shadow">[图片简介]</strong><span class="text_shadow">${pro.introduction}</span></li>
            <li><strong class="text_shadow">[热度]</strong><span class="text_shadow">${pro.heat}</span></li>
            <li><strong class="text_shadow">[国家]</strong><span class="text_shadow">${pro.state}</span></li>
            <li><strong class="text_shadow">[城市]</strong><span class="text_shadow">${pro.city}</span></li>
            <li><strong class="text_shadow">[发布时间]</strong><span class="text_shadow">${pro.time}</span></li>
          </ul>
        </div>
      </div>

    </div>
  </div>


  <!--footer  start-->
  <footer class="footer" style="margin-top: 100px;">
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
							<a href="#" target="_blank">
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
</div>
<div class="mask_bg" style="background-image: url('${pro.img}')"></div>
<div class="mask"></div>
<!--Include Js-->
<script src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>

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
<script>
</script>
</html>
