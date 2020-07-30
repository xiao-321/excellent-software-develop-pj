<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.daddy.utils.Utils" %>
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
    <link rel="stylesheet" type="text/css" href="css/footer_other.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css"/>
    <!--  <link href="font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' media="all"/>-->
    <link rel="stylesheet" type="text/css" href="css/animate.css"/>

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
    <div id="search">
        <form action="${pageContext.request.contextPath}/Search" method="post">
            <input type="search" placeholder="Please search" name="search" id="sear">
            <select name="content" id="content">
                <option value="">Select</option>
                <option value="title">Select by title</option>
                <option value="theme">Select by theme</option>
            </select>
            <select name="select" id="select">
                <option value="">Select</option>
                <option value="heat">Select by popularity</option>
                <option value="time">Select by time</option>
            </select>
            <button type="button" class="btn btn-default icon-search btn-sm" onclick="paging(1, 5)">
                <span class="glyphicon glyphicon-search " aria-hidden="true"></span> search
            </button>
        </form>
    </div>

    <!--banner  start-->

    <!--banner end-->
    <div class="wyzl">
        <!--wyzl end-->
        <div class="syzz">
            <div class="jqgk">
                <div class="contai">
                    <div class="top_tit">
                        <span class="span1" style="margin-top: 200px ;color:#00BBFF;" >SEARCH RESULT</span><br/>
                    </div>
                </div>
            </div>

            <div id="context" >
                <c:forEach items="${requestScope.data.data}" var="pro">
                    <div class="syzz-midden" style="background-color: #E8E8E8">
                        <div class="midden-img" >
                            <div><a href="Court?title=${pro.title}"><img src="${pro.img}" alt=""></a>
                            </div>
                        </div>
                        <div class="middle-text">
                            <h3>[Title]</h3>${pro.title}
                            <p>
                            <h3>[Author]</h3>${pro.author}
                            <p>
                            <h3>[Theme]</h3>${pro.theme}
                            <p>
                            <h3>[Time]</h3>${pro.time}
                        </div>

                    </div>
                </c:forEach>

                <c:if test="${requestScope.data.sum>0}">
                    <div class="btn_paging">
                        <button class="btn btn-primary" id="pre">Previous page</button>
                        <button class="btn btn-primary" id="next">Next page</button>
                        <span>Total <c:out value="${requestScope.data.total}"/> Page，Now <c:out
                                value="${requestScope.data.page}"/> Page</span>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--syzz end-->


<!--footer  start-->
<footer>
    <div class="copyright">
        Copyright © 2020 Lee.All rights reserved.ICP Record No.19302010006 Fudan
    </div>
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
                    var dateTime = new Date(pro[i].time);
                    var tree_time = dateTime.getFullYear() + '-'+ (dateTime.getMonth()+1) + '-'+ dateTime.getDate() +' '+ dateTime.getHours()+ ':'+ dateTime.getMinutes();
                    html += '<div class="syzz-midden" style="background-color: #E8E8E8">' +
                        '<div class="midden-img">' +
                        '<div> <a href = "comfortable.jsp"> <img src ="' + pro[i].img + '" alt = ""> </a></div>' +
                        '</div>' +
                        '<div class= "middle-text">' +
                        '<h3>[Title]</h3>' + pro[i].title +
                        '<p><h3>[Author]</h3>' + pro[i].author +
                        '<p><h3>[Theme]</h3>' + pro[i].theme +
                        '<p><h3>[Time]</h3>' + tree_time +
                        '</div>' +
                        '</div>'
                }
                html += '<div class="btn_paging" >' +
                    '<button class="btn btn-primary" id="pre" onclick="preBtn()"> Previous page </button>' +
                    '<button class="btn btn-primary" id="next" onclick="nextBtn()"> Next page </button>' +
                    '<span>Total ' + data.total + ' Page，Now ' + data.page + ' Page </span>' +
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
