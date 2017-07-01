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

</head>
<body>
<div id="wrapper">
     		<form action="${url }" method="post" onsubmit="return checkform()">
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td align="center" colspan="2">
    	<span style="font-weight: bold; font-size: 30px;">填写收货信息</span>
    	</td>
    	
    	</tr>
    	
    	<tr>
    	<td align="right" width="30%">
    	<span style="font-weight: bold; font-size: 15px;">收货信息：</span>
    	</td>
    	<td>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<select name="sid">
      <c:forEach items="${list}" var="bean">
       <option value="${bean.id }">
       收货人：${bean.truename }&nbsp;&nbsp;&nbsp;
       联系电话：${bean.phone }&nbsp;&nbsp;&nbsp; 
       收货地址：${bean.address }&nbsp;&nbsp;&nbsp;
      
       </option>
      </c:forEach>
     </select>
    	</td>
    	</tr>
    	
    	<tr>
    	<td align="right">
    	<span style="font-weight: bold; font-size: 15px;">备注：</span>
    	</td>
    	<td>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<textarea rows="7" cols="50" name="beizhu"></textarea>
    	</td>
    	</tr>
    	
    	
    	
    	
    	<tr>
    	<td align="right">
    	<span style="font-weight: bold; font-size: 15px;">操作:</span>
    	</td>
    	<td>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="submit" value="提交订单" />
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="重置" />
    	</td>
    	</tr>
    	
    	
    	
    	
    	</table>
    	
    	</form>

</div>
</body>
</html>
