<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>冠龙商城</title>

<link rel="stylesheet" href="css/demomeny.css">
<link rel="stylesheet" href="css/shouye.css">
	<script src="js/jquery-1.11.1.min.js"></script>
	<!--script   src="js/modernizr-custom-v2.7.1.min.js"></script-->
	<script>
		$(document).ready(function(){
	var $miaobian=$('.Xcontent08>div');
	var $huantu=$('.Xcontent06>img');
	var $miaobian1=$('.Xcontent26>div');
	$miaobian.mousemove(function(){miaobian(this);});
	$miaobian1.click(function(){miaobian1(this);});
	function miaobian(thisMb){
		for(var i=0; i<$miaobian.length; i++){
			$miaobian[i].style.borderColor = '#dedede';
		}
		thisMb.style.borderColor = '#cd2426';

		$huantu[0].src = thisMb.children[0].src;
	}
	function miaobian1(thisMb1){
		for(var i=0; i<$miaobian1.length; i++){
			$miaobian1[i].style.borderColor = '#dedede';
		}
//		thisMb.style.borderColor = '#cd2426';
		$miaobian.css('border-color','#dedede');
		thisMb1.style.borderColor = '#cd2426';
		$huantu[0].src = thisMb1.children[0].src;
	}
			$(".Xcontent33").click(function(){
			var value=parseInt($('.inputlabel').val())+1;
       		$('.inputlabel').val(value);
		})

		$(".Xcontent32").click(function(){	
			var num = $(".inputlabel").val()
			if(num>0){
				$(".inputlabel").val(num-1);
			}			
			
		})

		})
	
		
		
	
		
	
	</script>
	
</head>
<body>
		<div class="meny">
			<h1><a href="ShopIndex.jsp">商城首页</h1>


	<ul>
			<c:if test="${shop.username==null}">
			<li><a href="login.jsp">用户登录</a></li>
			<li><a href="#">商城公告</a></li>
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
  <div class="Xcontent">
		<ul class="Xcontent01">
			
				<div class="Xcontent06"><img src="images/shangpinxiangqing/nopic.png"></div>
				<ol class="Xcontent08">
					<div class="Xcontent07"><img src="images/shangpinxiangqing/nopic.png"></div>
					<div class="Xcontent09"><img src="images/shangpinxiangqing/nopic.png"></div>
					<div class="Xcontent10"><img src="images/shangpinxiangqing/nopic.png"></div>
					<div class="Xcontent11"><img src="images/shangpinxiangqing/nopic.png"></div>
					<div class="Xcontent12"><img src="images/shangpinxiangqing/nopic.png"></div>
				</ol>
				<ol class="Xcontent13">
					<div class="Xcontent14"><a href="#"><p>${product.pname }</p></a></div>
					<div class="Xcontent15"><p>${product.cate.catename }</p></div>
					<div class="Xcontent16"><p>${product.info }</p></div>
					<div class="Xcontent17">
						<p class="Xcontent18">售价</p>
						<p class="Xcontent19">￥<span>${product.price2 }</span></p>
						<div class="Xcontent20">

							<p class="Xcontent22">原价<span>￥ ${product.price1 }</span></p>
						</div>
						
					</div>
					<div class="Xcontent26">
						<p class="Xcontent27">颜色</p>
						<div class="Xcontent28"><img  src="images/shangpinxiangqing/X14.png"></div>
							<div class="Xcontent29"><img  src="images/shangpinxiangqing/X1.png"></div>
					</div>
					<div class="Xcontent30">
						<p class="Xcontent31">数量
						<div class="Xcontent32"><img src="images/shangpinxiangqing/X15.png"></div>
						<form>	
            <input class="inputlabel" value="1" style="height: 30px;
	width: 60px;
	margin-top: 34px;
	border: 1px solid #dddddd;
	line-height: 30px;
	text-align: center;
	float: left;"></input></form>
						<div class="Xcontent33" ><img src="images/shangpinxiangqing/16.png"></div>

					</div>
					<div class="Xcontent34"><a href="indexmethod!gouwucheadd?id=${product.id }"><img src="images/shangpinxiangqing/X17.png"></a></div>
					<div class="Xcontent35"><a href="indexmethod!gouwucheadd?id=${product.id }"><img src="images/shangpinxiangqing/X18.png"></a></div>
				
			</ol>
		
			
			
		</ul>
		
	</div>
  </div>
  <!--%@ include file="head.jsp" %-->
  
  
  
  <!--div id="page_main" class="clearfix">
    <div class="page-right">
     <div class="site-nav"><span>当前位置 : </span><a href=".">网站首页</a> &gt;&gt; <a href="javascript:void(0)" >商品详细信息</a></div>
      <div class="page-news">
      <table border="0" align="center">
      
     
      


<tr><td class="time-list"><span>商品名</span></td><td align="center">${product.pname }</td></tr>
<tr><td class="time-list"><span>商品图片</span></td><td align="center"><img src="uploadfile/${product.imgpath }" width="250" height="250"  /></td></tr>

<tr><td class="time-list"><span>所属分类</span></td><td align="center">${product.cate.catename }</td></tr>

<tr><td class="time-list"><span>原价</span></td><td align="center">${product.price1 }￥</td></tr>

<tr><td class="time-list"><span>促销价</span></td><td align="center">${product.price2 }￥</td></tr>

<tr><td class="time-list"><span>销量</span></td><td align="center">${product.xiaoliang }</td></tr>

<tr><td class="time-list"><span>库存</span></td><td align="center">${product.kucun }</td></tr>

<tr><td class="time-list"><span>好评</span></td><td align="center">${product.haoping }</td></tr>

<tr><td class="time-list"><span>中评</span></td><td align="center">${product.zhongping }</td></tr>

<tr><td class="time-list"><span>差评</span></td><td align="center">${product.chaping }</td></tr>

<tr><td class="time-list"><span>简介</span></td><td align="center">
<textarea rows="3" cols="100" readonly="readonly">${product.info }</textarea>
</td></tr>

<tr><td class="time-list"><span>商品评价</span></td><td align="center">
<a href="indexmethod!pingjialist3.action?pid=${product.id }" ><span>查看</span></a>
</td></tr>

<tr><td class="time-list"><span>操作</span></td><td align="center">
<a href="indexmethod!gouwucheadd?id=${product.id }">
 <img src="uploadfile/gwc.jpg"  border="0"/>
</a>
     &nbsp;&nbsp;&nbsp;&nbsp;
     <input  type="button" value="返回"  onclick="javascript:history.go(-1);" />
</td></tr>



      </table>
<div class="page_list"></div>
      </div>
    </div>
    <!--div class="page-left">
      
      
       <!--%@ include file="left.jsp" %-->
    
    <!--/div-->
  <!--/div-->
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
