<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,700' rel='stylesheet' type='text/css'>



	<link rel="stylesheet" href="css/dingdanreset.css"> <!-- CSS reset -->

	<link rel="stylesheet" href="css/dingdanstyle.css"> <!-- Gem style -->

	<script src="js/modernizr.js"></script> <!-- Modernizr -->
<link rel="stylesheet" href="css/demomeny.css">
<title>购物商城</title>

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
			<li><a href="#">用户退出</a></li>
			</c:if>
			</ul>
		</div>

		<div class="meny-arrow"></div>

		<div class="contents">
		
		<section id="cd-table">

	<header class="cd-table-column">

		<h2>订单号</h2>

		<ul>

			<li>收件人姓名</li>

			<li>订单状态</li>

			<li>总价</li>

			<li>是否拖欠款项</li>

			<li>收货地址</li>
			
			<li>收件人手机</li>
			
			<li>添加时间</li>

			
			
		</ul>

	</header>



	<div class="cd-table-container">

		<div class="cd-table-wrapper">


<c:forEach items="${list}"  var="bean">
			<div class="cd-table-column">

				<h2>${bean.orderid }</h2>

				<ul>

					<li>${bean.sjname}</li>

					<li>${bean.status }</li>

					<li>${bean.zongjia}￥</li>

					<li class="cd-unchecked"><span>No</span></li>
					
					<li>${bean.address}</li>
					
					<li>${bean.phone}</li>
					
					<li>${fn:substring(bean.createtime,0, 19)}</li>
					
				</ul>

			</div> <!-- cd-table-column -->
</c:forEach>
</div>

	</div> <!-- cd-table-container -->



	<em class="cd-scroll-right"></em>

</section> <!-- cd-table -->



<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>

<script src="js/main.js"></script> <!-- Gem jQuery -->
<!--div id="wrapper">
      <table border="0" align="center">
      <tr><th class="news-time">订单号</th><th class="news-title">收件人姓名</th>
      <th class="news-title">订单状态</th>
      <th class="news-title">总价</th>
      <th class="news-title">操作</th></tr>
<c:forEach items="${list}"  var="bean">

<tr><td class="time-list"><span>${bean.orderid }</span></td>
<td align="center">${bean.sjname }</td>
<td align="center">${bean.status }</td>
<td align="center">${bean.zongjia }</td>
<td align="center">
	<a href="${url2 }update3?id=${bean.id }">查看</a> 
	&nbsp;
	<c:if test="${bean.status=='已处理'}">
	<a href="indexmethod!pingjialist?orderid=${bean.orderid }">评价列表</a>
	</c:if>
	
	
</td>
</tr>
</c:forEach>
      </table>
      </div-->
      
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
</body>
</html>
