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
      <div class="site-nav"><span>当前位置 : </span><a href=".">网站主页</a> &gt;&gt; <a href="javascript:void(0)" >评价</a></div>
      <div class="page-guestbook">

      <form method="post"  onSubmit="return check()" action="indexmethod!pingjiaadd2.action?id=${bean.id }">
      <dl class="clearfix">
      <dt>评价：</dt>
      <dd>
      <select name="pingjia">
      <option value="好评">好评</option>
      <option value="中评">中评</option>
      <option value="差评">差评</option>
      </select>
      </dd>
      
    
      <dt>评语：</dt>
      <dd>
      <textarea rows="7" cols="50" name="pingyu"></textarea>
      </dd>
      
      
      
      
     
      </dl>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input src="images/submit.jpg" type="image"  ></input>
      <a href="javascript:void(0)" onclick="javascript:history.go(-1);" >
      <img src="images/fanhui.jpg"></img>
      </a>
      </form>
      </div>
    </div>
    <div class="page-left">
      
      
      <%@ include file="left.jsp" %>

    </div>
  </div>
    <%@ include file="bottom.jsp" %>
</div>
</body>
</html>
