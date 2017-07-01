<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="shop.util.Util"%>
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
		GetCount();
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
	$("#zong1").html((conts).toFixed(2));
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
			<li><a href="#">个人信息</a></li>
			<li><a href="#">订单管理</a></li>
			<li><a href="gouwuche.jsp">购物车</a></li>
			<li><a href="#">用户退出</a></li>
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
	$(function () {
		var t = $("#text_box1");
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

			$("#total1").html((parseInt(t.val()) * 9).toFixed(2));
			$("#newslist-1").val(parseInt(t.val()) * 9);
		}
		setTotal();
	})
	</script>
	<c:forEach items="${list}"  var="bean">
	<table cellpadding="0" cellspacing="0" class="gwc_tb2">
		<tr>
			<td class="tb2_td1"><input type="checkbox" value="1" name="newslist" id="newslist-1" /></td>
			<td class="tb2_td2"><a href="#"><img src="images/img1.jpg"/></a></td>
			<td class="tb2_td3"><a href="#">${bean.product.pname }</a></td>
			<td class="tb1_td4">一件</td>
			<td class="tb1_td5">
				<input id="min1" name=""  style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="-" />
				<input id="text_box1" name="" type="text" value="1" style=" width:30px; text-align:center; border:1px solid #ccc;" />
				<input id="add1" name="" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="+" />
			</td>
			<td class="tb1_td6"><label id="total1" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></td>
			<td class="tb1_td7"><a href="#">删除</a></td>
		</tr>
	</table>
	

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
			<td class="tb3_td3">合计(不含运费):<span>￥</span><span style=" color:#ff5500;"><label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></span></td>
			<td class="tb3_td4"><span id="jz1">结算</span><a href="#" style=" display:none;"  class="jz2" id="jz2">结算</a></td>
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