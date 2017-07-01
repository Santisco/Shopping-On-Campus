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
<script language="javascript" type="text/javascript">

function checkform()
{
	 
	

	
	
	
	if (document.getElementById('pnameid').value=="")
	{
		alert("商品名不能为空");
		return false;
	}
	
	
	var v1 = document.getElementById("price1id").value;
	var v2 = document.getElementById("price2id").value;
	if(v1==""){
		alert('原价不能为空');
		return false;
	}
	if(v2==""){
		alert('优惠价不能为空');
		return false;
	}
	
	
	
	 if(isNaN(v1)){ //数字 
	 	alert('原价必须是数字');
		return false;
	 }
	 if(isNaN(v2)){ //数字 
	 	alert('优惠价必须是数字');
		return false;
	 }
	 if(v1<0){
		alert('原价不能为负数');
		return false;
	}
	
	 if(v2<0){
		alert('优惠价不能是负数');
		return false;
	}
	
	
	 
	 if(eval(v1)<=eval(v2)){
	 	alert('原价必须大于优惠价');
		return false;
	 }
	 
	 var reg1 =  /^\d+$/; 
	 
	 var v3 = document.getElementById("kucunid").value;
	 
	 if(v3.match(reg1) == null){
	 	alert('库存必须是整数');
		return false;
	 } 
	
 	
	return true;
	
}


</script>
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
     <form action="${url }" method="post" onsubmit="return checkform()"  enctype="multipart/form-data">
<TABLE cellSpacing=0 cellPadding=0 width="60%" align=center border=1>
  	
  	<TR >
    <TD align="center" >分类名:</TD>
    <TD align="center"> 
    <select name="cate">

<c:forEach items="${catelist}" var="cate">
<option value="${cate.id }"  <c:if test="${bean.cate.catename==cate.catename }">selected</c:if> >${cate.catename }</option>
</c:forEach>
</select>
 
    </TD>
    </TR>
    
    
    <TR >
    <TD align="center" >商品名:</TD>
    <TD align="center"> 
    <input  type="text" name="pname"  id='pnameid'  size="30" value="${bean.pname }" />
 
    </TD>
    </TR>
    
    
     <TR >
    <TD align="center" >商品图片：</TD>
    <TD align="center"> 
    <img src="<%=basePath %>uploadfile/${bean.imgpath }"  width="300" height="300"/>
 
    </TD>
    </TR>
    
    
     <TR >
    <TD align="center" >上传新图片：</TD>
    <TD align="center"> 
    <input   name="uploadfile"  type="file"   size="20"  />
 
    </TD>
    </TR>
    
     <TR >
    <TD align="center" >原价:</TD>
    <TD align="center"> 
    <input  type="text" name="price1"  id='price1id'  size="30" value="${bean.price1 }" />
 
    </TD>
    </TR>
    
    
     <TR >
    <TD align="center" >促销价:</TD>
    <TD align="center"> 
    <input  type="text" name="price2"  id='price2id'  size="30" value="${bean.price2 }" />
 
    </TD>
    </TR>
    
    
    
    
     <TR >
    <TD align="center" >简介:</TD>
    <TD align="center"> 

 		<textarea rows="7" cols="50" name="info">${bean.info }</textarea>
 
    </TD>
    </TR>
    
    
    
    
    <TR height=>
    <TD align="center" > 操作：</TD>
    <TD align="center"> 
     <input type="submit" value="提交" style="width: 60px" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
    
    </TD>
    </TR>
    
    </TABLE>
    </form>
</div>
</body>
</html>

