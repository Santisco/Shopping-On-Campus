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
<title>购物商城</title>

<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/webmain.css" rel="stylesheet" type="text/css" />
<link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="scripts/jquery.KinSlideshow-1.2.1.js"></script>
<script type="text/javascript" src="scripts/webtry_roll.js"></script>
<script type="text/javascript" src="scripts/ddsmoothmenu.js"></script>
<script type="text/javascript">
ddsmoothmenu.init({
	mainmenuid: "MainMenu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})
</script>
</head>
<body>
<div id="wrapper">
    <div class="top">
    <span style="font-size: 50px;font-weight: bold;">
  购物商城
    </span>
    
    
  </div>
  
  <%@ include file="head.jsp" %>
  
  
  
  <div id="page_main" class="clearfix">
    <div class="page-right">
     <div class="site-nav"><span>当前位置 : </span><a href=".">网站首页</a> &gt;&gt; <a href="javascript:void(0)" >收货信息</a></div>
      <div class="page-news">
      <a href="${url2 }add"><span style="font-size: 25px;font-weight: bold;">添加新收货信息</span></a>
      <table border="0" align="center">
      <tr><th class="news-time">收货人姓名</th><th class="news-title">电话</th><th class="news-title">详细地址</th><th class="news-title">操作</th></tr>
<c:forEach items="${list}"  var="bean">

<tr><td class="time-list"><span>${bean.truename }</span></td><td align="center">${bean.phone }</td><td align="center">${bean.address }</td>
<td align="center">
	<a href="${url2 }update?id=${bean.id }">修改</a> &nbsp; 
  	<a href="${url2 }delete?id=${bean.id }">删除</a>
</td>
</tr>
</c:forEach>
      </table>
<div class="page_list"><div class="list_info">
${pagerinfo }
</div></div>
      </div>
    </div>

  </div>
   <%@ include file="bottom.jsp" %>
</div>
</body>
</html>
