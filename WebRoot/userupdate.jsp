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
<link rel="stylesheet" href="css/common.css"/>
<link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/infostyle.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
        <link rel="stylesheet" href="css/demomeny.css">
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script> 
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
var w,h,className;
function getSrceenWH(){
	w = $(window).width();
	h = $(window).height();
	$('#dialogBg').width(w).height(h);
}

window.onresize = function(){  
	getSrceenWH();
}  
$(window).resize();  

$(function(){
	getSrceenWH();
	
	//显示弹框
	$('.setting span').click(function(){
		className = $(this).attr('class');
		$('#dialogBg').fadeIn(300);
		$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
	});
	
	//关闭弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBg').fadeOut(300,function(){
			$('#dialog').addClass('bounceOutUp').fadeOut();
		});
	});
});
</script>
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

		<div class="contents">
<div id="wrapper">
<h1><span>个人信息资料展示</span></h1>
				<h3>支持自定义修改</h3>
		<div class="box">
		<div id="dialogBg"></div>
		<div id="dialog" class="animated">
			<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">关闭</a>
			</div>
			<form action="indexmethod!userupdate2.action" method="post" id="editForm" onSubmit="return check()">
				<ul class="editInfos">
					<li><label><font color="#ff0000">* </font>填写密码：<input type="password" name="password"  value="" class="ipt" id="passwordid" /></label></li>
					<li><label><font color="#ff0000">* </font>确认密码：<input type="password" name="password2" value="" class="ipt" id="password2id" /></label></li>
					<li><label><font color="#ff0000">* </font>用户姓名：<input type="text" name="truename"  value="" class="ipt" id="truenameid"/></label></li>
					<li><label><font color="#ff0000">* </font>家庭地址：<input type="text" name="address"  value="" class="ipt" id="addressid"/></label></li>
					<li><label><font color="#ff0000">* </font>手机号码：<input type="text" name="phone"  value="" class="ipt" id="phoneid"/></label></li>
					<li><input type="submit" value="确认提交" class="submitBtn" /></li>
				</ul>
			</form>
		</div>
	</div>		
			
				<div id="sb-container" class="sb-container">
				
					<div>
						<span class="sb-icon icon-cog"></span>
						<h4 class="setting"><span>All Settings</span></h4>
					</div>
					<div>
						<span class="sb-icon icon-flight"></span>
						<h4><span>User Destination</span></h4>
					</div>	
					<div>
						<span class="sb-icon icon-eye"></span>
						<h4><span>Password ${bean.password }</span></h4>
					</div>	
					<div>
						<span class="sb-icon icon-globe"></span>
						<h4><span>Address <br/>${bean.address }</span></h4>
					</div>	
					<div>
						<span class="sb-icon icon-picture"></span>
						<h4><span>User Images</span></h4>											
					</div>	
					<div>
						<span class="sb-icon icon-video"></span>
						<h4><span>User ${bean.truename }</span></h4>											
					</div>	
					<div>
						<span class="sb-icon icon-mobile"></span>
						<h4><span>Mobile ${bean.phone }</span></h4>											
					</div>

					<div>
						<h4><span>Profile</span></h4>
						<span class="sb-toggle">Click to open</span>
						<h5><span>We &hearts; color</span></h5>											
					</div>
					
					
				</div><!-- sb-container -->
				
        <script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.swatchbook.js"></script>
		<script type="text/javascript">
			$(function() {
			
				$( '#sb-container' ).swatchbook( {
					// number of degrees that is between each item
					angleInc : 15,
					neighbor : 15,
					// if it should be closed by default
					initclosed : true,
					// index of the element that when clicked, triggers the open/close function
					// by default there is no such element
					closeIdx : 11
				} );
			
			});
		</script>
	
	
</div>
  
<script type="text/javascript">
function check()
{
	

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
      <!--form method="post"  onSubmit="return check()" action="indexmethod!userupdate2.action">
      <dl class="clearfix" align = 'center'>
      
      <dt>密码：</dt>
      <dd><input name="password" type="password" id="passwordid" value="${bean.password }" /><span>*</span></dd>
      <dt>确认密码：</dt>
      <dd><input name="password2" type="password" id="password2id" value="${bean.password }" /><span>*</span></dd>
      <dt>姓名：</dt>
      <dd><input name="truename" type="text" id="truenameid" value="${bean.truename }" /><span>*</span></dd>
      <dt>地址：</dt>
      <dd><input name="address" type="text" id="addressid"  value="${bean.address }"/><span>*</span></dd>
      <dt>手机：</dt>
      <dd><input name="phone" type="text" id="phoneid" value="${bean.phone }" /><span>*</span></dd>
      
      
      
     
      </dl>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input src="images/submit.jpg" type="image"  ></input>
      <a href="javascript:void(0)" onclick="javascript:history.go(-1);" >
      <img src="images/fanhui.jpg"></img>
      </a>
      </form-->
</body>
</html>
