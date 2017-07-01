<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="shop.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>冠龙商城</title>
<meta name="Keywords" content="冠龙商城" />
<meta name="description" content="冠龙商城" />
<link rel="stylesheet" href="css/app.css">
<link rel="stylesheet" href="css/categoryindex.css">
<link rel="stylesheet" href="css/fonts.css">
<link rel="stylesheet" href="css/demomeny.css">
</head>
<body>
		<div class="meny">
			<h1><a href="ShopIndex.jsp">商城首页</h1>


			<ul>
			<c:if test="${shop.username==null}">
			<li><a href="login.jsp">用户登录</a></li>
			<li><a href="login.jsp">商城公告</a></li>
      		</c:if>
			<c:if test="${shop.username!=null}">
			<li><a href="indexmethod!userupdate.action" >个人信息</a></li>
			<li><a href="indexmethod!dingdanlist.action" >订单管理</a></li>
			<li><a href="indexmethod!gouwuchelist.action">购物车</a></li>
			<li><a href="indexmethod!loginout.action" >用户退出</a></li>
			</c:if>
			</ul>
		</div>

		<div class="meny-arrow"></div>
<!-- 代码 开始 -->
<div class="contents">
<div class="wrap" id="wrap">
<!--div style="float: left;padding-top: 30px;text-align: center;width: 100%;font-weight: bolder;color: #ff6600;">商品一览</div-->
<!-- 这个是第一种风格 Satrt-->
    <main>
          <ul class="ul items">

<c:forEach items="${list}" var="pro">
<li>
<figure class="effect-winston">
</a><img src="image/480_yugao.jpg"  />
 <figcaption>
                        <h2>
                            ${pro.pname }&nbsp;
                            <span>
                               ${pro.price2 }￥
                            </span>
                        </h2>
                        <p>
                           <a href="indexmethod!product.action?id=${pro.id }" >
                                <i class="icon-demo">
                                </i>
                            </a>
                            <a href="#" >
                                <i class="icon-buy">
                                </i>
                            </a>
                        </p>
                        <a href="#" >
                            查看更多
                        </a>
                    </figcaption>
</figure>
</li>
</c:forEach>
</ul>

      
    </div>
    </div>
    <script src="js/meny.js"></script>
		<script>
			// Create an instance of Meny
			var meny = Meny.create({
				// The element that will be animated in from off screen
				menuElement: document.querySelector( '.meny' ),

				// The contents that gets pushed aside while Meny is active
				contentsElement: document.querySelector( '.contents' ),

				// [optional] The alignment of the menu (top/right/bottom/left)
				position: Meny.getQuery().p || 'left',

				// [optional] The height of the menu (when using top/bottom position)
				height: 200,

				// [optional] The width of the menu (when using left/right position)
				width: 260,

				// [optional] Distance from mouse (in pixels) when menu should open
				threshold: 40,

				// [optional] Use mouse movement to automatically open/close
				mouse: true,

				// [optional] Use touch swipe events to open/close
				touch: true
			});

			// API Methods:
			// meny.open();
			// meny.close();
			// meny.isOpen();

			// Events:
			// meny.addEventListener( 'open', function(){ console.log( 'open' ); } );
			// meny.addEventListener( 'close', function(){ console.log( 'close' ); } );

			// Embed an iframe if a URL is passed in
			if( Meny.getQuery().u && Meny.getQuery().u.match( /^http/gi ) ) {
				var contents = document.querySelector( '.contents' );
				contents.style.padding = '0px';
				contents.innerHTML = '<div class="cover"></div><iframe src="'+ Meny.getQuery().u +'" style="width: 100%; height: 100%; border: 0; position: absolute;"></iframe>';
			}
		</script>

		
<!-- 这个是第一种风格 End-->
  </body>
</html>