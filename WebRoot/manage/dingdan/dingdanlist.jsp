<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
body {font-family: Arial, Helvetica, sans-serif; font-size:12px; text-align:center;}
a { text-decoration: none;}
#all {widht: 100%; text-align:center; margin:auto;}
#main {width: 96%; line-height: 1.8; margin:auto; border:1px #ccc dashed; text-align: left; text-indent: 2em;}
</style>

</head>

<body>
<div id="all">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=images/title_bg1.jpg>当前位置:---》》${title }</TD></TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/shadow_bg.jpg></TD></TR></TABLE>
<div align="left">
<form action="${url }" method="post">

订单号：<input name="orderid" type="text"  value="${orderid }">
<input type="submit"  value="查询"/>
</form>
</div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
  	
  	<TR >
    <TD align="center" >订单号</TD>
    <TD align="center" >收件人姓名</TD>
    <TD align="center" >订单状态</TD>
    <TD align="center" >总价</TD>
     <TD align="center" >添加时间</TD>

    <TD align="center"> 
  	操作
    </TD>
    </TR>
    <c:forEach items="${list}"  var="bean">

    <TR >
    <TD align="center" >${bean.orderid }</TD>
    <TD align="center" >${bean.sjname }</TD>
    <TD align="center" >${bean.status }</TD>
    <TD align="center" >${bean.zongjia }</TD>
    <TD align="center" >${fn:substring(bean.createtime,0, 19)}</TD>

    <TD align="center"> 
  	<a href="${url2 }update3?id=${bean.id }">查看</a> &nbsp; &nbsp; &nbsp;
	<c:if test="${bean.status=='未处理'}">
	<a href="${url2 }delete?id=${bean.id }">处理订单</a>
	</c:if>
  	
 
    </TD>
    </TR>
    </c:forEach>
    
    <TR >
    <TD align="center" colspan="21" >${pagerinfo }</TD>

  	
    </TR>
    
    
    </TABLE>
</div>
</body>
</html>

