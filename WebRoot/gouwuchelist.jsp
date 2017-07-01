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
<title>购物车</title>


<link href="css/gouwucheindex.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/demomeny.css">
 
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/Calculation.js"></script>
<script type="text/javascript">
$(document).ready(function () {

	//jquery特效制作复选框全选反选取消(无插件)
	// 全选        
	$(".allselect").click(function () {
		
		if($(this).attr("checked")){
			$(".gwc_tb2 input[name=newslist]").each(function () {
				$(this).attr("checked", true);
				// $(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
			});
			GetCount();
		
		}
		else
   		{
			$(".gwc_tb2 input[name=newslist]").each(function () {
				if ($(this).attr("checked")) {
					$(this).attr("checked", false);
					//$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
				} else {
					$(this).attr("checked", true);
					//$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
				} 
			});
			GetCount();
    
   		}
		
	});

	//反选
	$("#invert").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			if ($(this).attr("checked")) {
				$(this).attr("checked", false);
				//$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
			} else {
				$(this).attr("checked", true);
				//$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
			} 
		});
		GetCount();
	});

	//取消
	$("#cancel").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			$(this).attr("checked", false);
			// $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
		});

	});

	// 所有复选(:checkbox)框点击事件
	$(".gwc_tb2 input[name=newslist]").click(function () {
		if ($(this).attr("checked")) {
			//$(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
		} else {
			// $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
		}
	});

	// 输出
	$(".gwc_tb2 input[name=newslist]").click(function () {
		// $("#total2").html() = GetCount($(this));
		GetCount();
		//alert(conts);
	});
});
//******************
function GetCount() {
	var conts = 0;
	var aa = 0;
	$(".gwc_tb2 input[name=newslist]").each(function () {
		if ($(this).attr("checked")) {
			for (var i = 0; i < $(this).length; i++) {
				conts += parseInt($(this).val());
				aa += 1;
			}
		}
	});
	$("#shuliang").text(aa);
	$("#zong1").html(${zongjia});
	$("#jz1").css("display", "none");
	$("#jz2").css("display", "block");
}
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

<div class="gwc" style=" margin:auto;">
	<table cellpadding="0" cellspacing="0" class="gwc_tb1">
		<tr>
			<td class="tb1_td1"><input id="Checkbox1" type="checkbox"  class="allselect"/></td>
			<td class="tb1_td1">全选</td>
			<td class="tb1_td3">商品</td>
			<td class="tb1_td4">商品信息</td>
			<td class="tb1_td5">数量</td>
			<td class="tb1_td6">单价</td>
			<td class="tb1_td7">操作</td>
		</tr>
	</table>
		   
	<!---商品加减算总数---->
	<script type="text/javascript">
	function changenum(id, price){
		var t = document.getElementById(id+"_label").innerText;
		document.getElementById(id+"_box").value = document.getElementById(id+"_box").value -1;
		document.getElementById(id+"_label").innerText = price * document.getElementById(id+"_box").value + ".00￥";
		var num = document.getElementById(id+"_box").value;
	if (num < 0)
	{
		alert("购买数量必须为正整数");
		document.getElementById(id+"_box").value = 0;
		document.getElementById(id+"_label").innerText = "0.00￥";
	}

	}
	function addnum(id, price){
		document.getElementById(id+"_box").value++;
		document.getElementById(id+"_label").innerText = price * document.getElementById(id+"_box").value + ".00￥";
	}
	$(function () {
		var t = $(".result");
		$("#add1").click(function () {
			t.val(parseInt(t.val()) + 1)
			setTotal(); GetCount();
		})
		$("#min1").click(function () {
			if(t.val()>0){
				t.val(parseInt(t.val()) - 1)
				setTotal(); GetCount();
			}
		})
		function setTotal() {
			$("#total1").html((parseInt(t.val()) * 5).toFixed(2));
			$("#newslist-1").val(parseInt(t.val()) * 5);
		}
		setTotal();
	})
	</script>
	<c:forEach items="${list}"  var="bean">
	<table cellpadding="0" cellspacing="0" class="gwc_tb2">
		<tr>
			<td class="tb2_td1"><input type="checkbox" value="1" name="newslist" id="newslist-1" /></td>
			<td class="tb2_td2"><a href="#"><img src="images/shangpinxiangqing/nopicsmall.png"></a></td>
			<td class="tb2_td3"><a href="#">&nbsp &nbsp &nbsp ${bean.product.pname }</a></td>
			<td class="tb1_td4">一件</td>
			<td class="tb1_td5">
				<input  onclick="changenum(${bean.id }, ${bean.product.price2 })" name=""  style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="-" />
				<input id="${bean.id}_box" name="" type="text" value="1" style=" width:30px; text-align:center; border:1px solid #ccc;" />
				<input onclick="addnum(${bean.id }, ${bean.product.price2 })"  name="" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="+" />
			</td>
			<td class="tb1_td6"><label id="${bean.id}_label" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">${bean.product.price2 }￥</label></td>
			<td class="tb1_td7"><a href="#">删除</a></td>
		</tr>
	</table>
	</c:forEach>

	<!---总数---->
	<script type="text/javascript">
	
	$(function () {
		$(".quanxun").click(function () {
			setTotal();
			//alert($(lens[0]).text());
		});
		function setTotal() {
			var len = $(".tot");
			var num = 0;
			for (var i = 0; i < len.length; i++) {
				num = parseInt(num) + parseInt($(len[i]).text());

			}
			//alert(len.length);
			$("#zong1").text(parseInt(num).toFixed(2));
			$("#shuliang").text(len.length);
		}
		//setTotal();
	})
	</script>
	<table cellpadding="0" cellspacing="0" class="gwc_tb3">
		<tr>
			<td class="tb1_td1">&nbsp;</td>
			<td class="tb1_td1">&nbsp;</td>
			<td class="tb3_td1">&nbsp;</td>
			<td class="tb3_td2">已选商品 <label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label> 件</td>
			<td class="tb3_td3">合计(不含运费):<span>￥</span><span style=" color:#ff5500;"><label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;">0.00</label></span></td>
			<td class="tb3_td4"><a href="indexmethod!dingdanadd" class="jz2" id="jz2">结算</a></td>
		</tr>
	</table>
	

</div>
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


</body>
</html>
<!--!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<script language="javascript" type="text/javascript">

function changenum(id){
		var num = document.getElementById(id+"_num").value;
		var reg1 =  /^\d+$/;
	if (num.match(reg1) == null)
	{
		alert("购买数量必须为正整数");
		return false;
	}
		if (num == 0 )
	{
		alert("购买数量必须大于0的正整数");
		return false;
	}
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.location.href="indexmethod!gouwucheupdate?id="+id+"&sl="+num+"&t="+t;
		
		
	}

</script>

</head>
<body>
<div id="wrapper">
    <div class="top">
    <span style="font-size: 50px;font-weight: bold;">
  购物商城
    </span>
    
    
  </div>
  

  
  
  
  <div id="page_main" class="clearfix">
    <div class="page-right">
     <div class="site-nav"><span>当前位置 : </span><a href=".">网站首页</a> &gt;&gt; <a href="javascript:void(0)" >我的购物车</a></div>
      <div class="page-news">
      <form action="" method="post" >
      <table border="0" align="center">
      <tr><th class="news-time">商品名</th><th class="news-title">价格</th><th class="news-title">购买数量</th>
      <th class="news-title">小计</th>
      <th class="news-title">操作</th></tr>
<c:forEach items="${list}"  var="bean">

<tr><td class="time-list"><span>${bean.product.pname }</span></td><td align="center">${bean.product.price2 }￥</td>
<td align="center">
<input type="text" name="sl"  value="${bean.sl }" id="${bean.id }_num"  size="5"/>&nbsp;
    <a href="javascript:;"  onclick="changenum(${bean.id })">变更</a> &nbsp;</td>
</td>

<td align="center">${bean.product.price2 * bean.sl}￥</td>
<td align="center">
	
	<a href="indexmethod!gouwuchedelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); ">删除</a>
  	
</td>
</tr>
</c:forEach>

<tr><td class="time-list" colspan="2"><span style="color: red;font-size: 25px;font-weight: bold;">总价：${zongjia }￥</span></td>

<td align="center" colspan="3">
<a href="indexmethod!dingdanadd">
<img src="images/js.jpg" border="0"></img>
</a>
</td>

</tr>

      </table>
      </form>
      
<div class="page_list"></div>
      </div>
    </div>
    <div class="page-left">
      

    
    </div>
  </div>

</div>
</body>
</html-->
