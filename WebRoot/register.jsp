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
<title>注册</title>
<link rel="stylesheet" href="css/resetLogin.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/loginstyle.css">
</head>
<body oncontextmenu="return false">
       <!--link rel="stylesheet" href="css/resetLogin.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/loginstyle.css"-->
        <div class="page-container" style="margin-top:50px;">
            <h1>Welcome</h1>
            <form method="post"  onSubmit="return check()" action="indexmethod!register.action">
				<div>
					<input type="text" name="username" id="usernameid" placeholder="请输入您的账号" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="password" id="passwordid" placeholder="请输入您的密码" oncontextmenu="return false" onpaste="return false" />
                </div>
                <div>
					<input type="password" name="password2" id="password2id" placeholder="请再次输入您的密码" oncontextmenu="return false" onpaste="return false" />
                </div>
                                <div>
					<input type="text" name="truename" id="truenameid" placeholder="请输入您的姓名" oncontextmenu="return false" onpaste="return false" />
                </div>
                                <div>
					<input type="text" name="phone" id="phoneid" placeholder="请输入您的电话" oncontextmenu="return false" onpaste="return false" />
                </div>
                                <div>
					<input type="text" name="address" id="addressid" placeholder="请输入您的地址" oncontextmenu="return false" onpaste="return false" />
                </div>
                      <button id="submit">Register</button>
      <!--a href="javascript:void(0)" onclick="javascript:history.go(-1);" >
      <button id="return">Return</button-->
            </form>
        </div>
		<div class="alert" style="display:none">
			<h2>提示</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">知道了</a></p>
			</div>
		</div>

        <!-- Javascript -->
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
        <script type="text/javascript">
function check()
{
	 if (document.getElementById('usernameid').value=="")
	{
		alert("用户名不能为空");
		return false;
	}
	var valid=/^\w+$/;
	if(!valid.test(document.getElementById('usernameid').value)){
		alert("用户名必须是数字、字母或下划线");
		return false;
	}

	if (document.getElementById('passwordid').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('passwordid').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('passwordid').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 
	if (document.getElementById('truenameid').value=="")
	{
		alert("真实姓名不能为空");
		return false;
	}
	if (document.getElementById('addressid').value=="")
	{
		alert("地址不能为空");
		return false;
	}
	if (document.getElementById('phoneid').value=="")
	{
		alert("手机不能为空");
		return false;
	}
	
	valid=/^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;  
	if(!valid.test(document.getElementById('phoneid').value)){
		alert("请输入正确的手机格式");
		return false;
	}
	
	
	return true;
}
</script>
<!--div id="wrapper">
<script type="text/javascript">
function check()
{
	 if (document.getElementById('usernameid').value=="")
	{
		alert("用户名不能为空");
		return false;
	}
	var valid=/^\w+$/;
	if(!valid.test(document.getElementById('usernameid').value)){
		alert("用户名必须是数字、字母或下划线");
		return false;
	}

	if (document.getElementById('passwordid').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('passwordid').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('passwordid').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 
	if (document.getElementById('truenameid').value=="")
	{
		alert("真实姓名不能为空");
		return false;
	}
	if (document.getElementById('addressid').value=="")
	{
		alert("地址不能为空");
		return false;
	}
	if (document.getElementById('phoneid').value=="")
	{
		alert("手机不能为空");
		return false;
	}
	
	valid=/^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;  
	if(!valid.test(document.getElementById('phoneid').value)){
		alert("请输入正确的手机格式");
		return false;
	}
	
	
	return true;
}
</script>
      <form method="post"  onSubmit="return check()" action="indexmethod!register.action">
      <dl class="clearfix">
      <dt>用户名：</dt>
      <dd><input name="username" type="text" id="usernameid"  size="40"/><span>*</span></dd>
      <dt>密码：</dt>
      <dd><input name="password" type="password" id="passwordid" /><span>*</span></dd>
      <dt>确认密码：</dt>
      <dd><input name="password2" type="password" id="password2id" /><span>*</span></dd>
      <dt>姓名：</dt>
      <dd><input name="truename" type="text" id="truenameid" /><span>*</span></dd>
      <dt>地址：</dt>
      <dd><input name="address" type="text" id="addressid" /><span>*</span></dd>
      <dt>手机：</dt>
      <dd><input name="phone" type="text" id="phoneid" /><span>*</span></dd>
      
      
      
     
      </dl>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input src="images/reg.jpg" type="image"  ></input>
      <a href="javascript:void(0)" onclick="javascript:history.go(-1);" >
      <img src="images/fanhui.jpg"></img>
      </a>
      </form>
</div-->
</body>
</html>
