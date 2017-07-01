<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物商城管理后台</title>
</head>

<frameset cols="*" rows="86, *" id="frame_main"  border="0">
    <frame src="head.jsp" noresize="noresize" name="header">
    
    <frameset cols="240, *">
    	<frame src="menu.jsp" name="menu" />
    	<frame src="main.jsp" name="main">
    </frameset>
</frameset>

<noframes><body>
</body>
</noframes></html>

