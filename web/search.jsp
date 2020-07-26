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
    <!--  <link href="font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' media="all"/>-->
    <link rel="stylesheet" type="text/css" href="css/animate.css"/>

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
                        <li><a href="index.jsp" class="active">首页</a></li>
                        <li><a href="Court">热门图片</a>
                            <ul>
                                <li><a href="Court?title=万竹">万林竹海</a></li>
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
    <div id="search">
        <form action="${pageContext.request.contextPath}/Search" method="post">
            <input type="search" placeholder="请输入搜索内容" name="search" id="sear">
            <select name="content" id="content">
                <option value="">请选择</option>
                <option value="title">标题筛选</option>
                <option value="theme">主题筛选</option>
            </select>
            <select name="select" id="select">
                <option value="">请选择</option>
                <option value="heat">热度筛选</option>
                <option value="time">时间筛选</option>
            </select>
            <button type="button" class="btn btn-default icon-search btn-sm" onclick="paging(1, 5)">
                <span class="glyphicon glyphicon-search " aria-hidden="true"></span> 搜索
            </button>
        </form>
    </div>

    <!--banner  start-->
    <section class="banner">
        <!--<div><img src="images/banner1.jpg" alt=""></div>-->
    </section>
    <!--banner end-->
    <div class="wyzl">
        <!--wyzl end-->
        <div class="syzz">
            <div class="jqgk">
                <div class="contai">
                    <div class="top_tit">
                        <span class="span1" style="margin-top: 200px">搜索结果</span><br/>
                        <span class="span2">SEARCH RESULT</span>
                    </div>
                    <div class="xia_x">
                        <span class="img"></span>
                    </div>
                </div>
            </div>

            <div id="context">
                <c:forEach items="${requestScope.data.data}" var="pro">
                    <div class="syzz-midden">
                        <div class="midden-img">
                            <div><a href="Court?title=${pro.title}"><img src="${pro.img}" alt=""></a>
                            </div>
                        </div>
                        <div class="middle-text">
                            <p>
                            <h3>[作者]</h3>${pro.author}
                            <p>
                            <h3>[主题]</h3>${pro.theme}
                            <p>
                            <h3>[发布时间]</h3>${pro.time}
                        </div>

                    </div>
                </c:forEach>

                <c:if test="${requestScope.data.sum>0}">
                    <div class="btn_paging">
                        <button class="btn btn-primary" id="pre">上一页</button>
                        <button class="btn btn-primary" id="next">下一页</button>
                        <span>共<c:out value="${requestScope.data.total}"/>页，当前<c:out
                                value="${requestScope.data.page}"/>页</span>
                    </div>
                </c:if>
            </div>
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


<!--Include Js-->
<script src="js/jquery-3.3.1.js" type="text/javascript" charset="utf-8"></script>

<!--移动端导航-->
<script src="js/jquery.mmenu.all.min.js" type="text/javascript" charset="utf-8"></script>


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
<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
<script type="text/javascript">
    let page = ${requestScope.data.page};
    let total = ${requestScope.data.total};

    function paging(page, limit) {
        let sear = $("#sear").val();
        let content = $("#content").val();
        let select = $("#select").val();
        $.ajax({
            url: "/sear"
            , dataType: "json"
            , contentType: "application/json;charset=utf-8"
            , type: "post"
            , async: false
            , data: JSON.stringify({search: sear, content: content, select: select, page: page, limit: limit})
            , success: function (data) {
                let html = '';
                let pro = data.data;
                for (let i = 0; i < pro.length; i++) {
                    html += '<div class="syzz-midden">' +
                        '<div class="midden-img">' +
                        '<div> <a href = "comfortable.jsp"> <img src ="' + pro[i].img + '" alt = ""> </a></div>' +
                        '</div>' +
                        '<div class= "middle-text">' +
                        '<p><h3>[作者]</h3>' + pro[i].author +
                        '<p><h3>[主题]</h3>' + pro[i].theme +
                        '<p><h3>[发布时间]</h3>' + pro[i].time +
                        '</div>' +
                        '</div>'
                }
                html += '<div class="btn_paging" >' +
                    '<button class="btn btn-primary" id="pre" onclick="preBtn()"> 上一页 </button>' +
                    '<button class="btn btn-primary" id="next" onclick="nextBtn()"> 下一页 </button>' +
                    '<span>共' + data.total + '页，当前' + data.page + '页 </span>' +
                    '</div>';
                $("#context").html(html);
                total=data.total
            }
        });
    }

    let preBtn =function () {
        let limit = 5;
        if (page > 1) {
            page--;
            paging(page, limit);
        }
    };

    let nextBtn =function () {
        let limit = 5;
        if (page < total) {
            page++;
            paging(page, limit);
        }
    };
    $("#pre").click(function () {
        preBtn();
    });
     $("#next").click(function () {
         nextBtn()
     });

</script>
</body>
</html>
