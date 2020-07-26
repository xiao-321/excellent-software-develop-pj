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
    <link rel="stylesheet" type="text/css" href="css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="css/addPic.css"/>

</head>
<body>

<div>
    <!--header-->
    <header class="header home_p" style="position: inherit">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo1.png" alt=""/></a>
            </div>
            <a href="#mmenu" class="phone-nav"><i class="fa fa-list"></i></a>
            <div class="logo_right">
                <nav class="nav">
                    <ul>
                        <li><a href="index.jsp" class="active">首页</a></li>
                        <li><a href="court_travel_show.jsp">热门图片</a></li>
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
    <!--header-->
    <div id="search">
        <form id="addform" action="">
            分享标题:<input style="margin-left: 29px" type="text" placeholder="请输入">
            图片内容：<input id="file_upload" type="file"><br>
            分享作者：<input style="margin-left: 16px" type="text" placeholder="请输入"><br>
            分享主题：<input style="margin-left: 16px" type="number" placeholder="请输入"><br>
            国家：<input style="margin-left: 45px" type="number" placeholder="请输入"><br>
            所属城市：<input style="margin-left: 15px;" type="number" placeholder="请输入"><br>
            分享内容：<textarea style="margin-left: 15px;" type="text" placeholder="请输入"></textarea>
            <input style="margin-left: 15px;" type="text" placeholder="请输入" hidden><br>
            <img id="preview" src="" alt="请上传图片">
        </form>
    </div>

</div>
<!--syzz end-->


<!--footer  start-->
<footer class="footer" style="margin-top: 552px;">
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
            formdata.append("fileUpLoad",file_upload);
            $.ajax({
                url:"/upload",
                type:'post',
                data:formdata,
                async:false,
                cache: true,
                processData: false,
                enctype:'multipart/form-data',
                success:function (data) {
                    console.log(data);
                },error:function (data) {
                    console.log(data);
                }
            })
        });
    });

</script>
</body>
</html>
