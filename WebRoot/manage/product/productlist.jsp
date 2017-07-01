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
<a href="${url2 }add"><span style="font-size: 25px;font-weight: bold;">添加新商品</span></a>
分类名：
<select name="catename">
<option value="">所有选项</option>
<c:forEach items="${catelist}" var="cate">
<option value="${cate.catename }" <c:if test="${catename==cate.catename }">selected</c:if> >${cate.catename }</option>
</c:forEach>
</select>

商品名：<input name="pname" type="text"  value="${pname }">
<input type="submit"  value="查询"/>
</form>
</div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
  	
  	<TR >
    <TD align="center" >分类名</TD>
    <TD align="center" >商品名</TD>
    <TD align="center" >原价</TD>
    <TD align="center" >促销价</TD>
    <TD align="center" >推荐状态</TD>
    <TD align="center" >销量</TD>
    <TD align="center" >库存</TD>
    <TD align="center" >添加时间</TD>

    <TD align="center"> 
  	操作
    </TD>
    </TR>
    <c:forEach items="${list}"  var="bean">

    <TR >
    <TD align="center" >${bean.cate.catename }</TD>
    <TD align="center" >${bean.pname }</TD>
    <TD align="center" >${bean.price1 }</TD>
    <TD align="center" >${bean.price2 }</TD>
    <TD align="center" >${bean.tuijian }</TD>
    <TD align="center" >${bean.xiaoliang }</TD>
    <TD align="center" >${bean.kucun }</TD>
    <TD align="center" >${bean.createtime }</TD>

    <TD align="center"> 
  	<a href="${url2 }update3?id=${bean.id }">查看</a> &nbsp; 
  	<a href="${url2 }update?id=${bean.id }">修改</a> &nbsp; 
  	<a href="${url2 }delete?id=${bean.id }">删除</a>&nbsp; 
  	<a href="${url2 }update5?id=${bean.id }">商品入库</a> &nbsp; 
  	<c:if test="${bean.tuijian=='未推荐'}">
  	<a href="${url2 }delete2?id=${bean.id }">推荐</a>&nbsp; 
  	</c:if>
  	<c:if test="${bean.tuijian=='推荐'}">
  	<a href="${url2 }delete3?id=${bean.id }">取消推荐</a>&nbsp; 
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

