<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="shop.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>冠龙商城</title>

<meta name = "keywords" content = "SMINT jQuery Plugin, SMINT, jQuery Plugin, One Page Website, Sticky Navigation" />
<meta name = "description" content = "SMINT is a simple plugin for lovers of one page websites, which helps with sticky menus and page scrolling." />
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" type="text/css" href="css/ggstyle.css" />
<link rel="stylesheet" href="css/index.css" />
<link href="css/indexstyle.css" rel="stylesheet" type="text/css" /> 
<link href="css/demo.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/search-form.css" />
<style type="text/css">
*{margin:0;padding:0;}
#xinpin{width:962px;height:300px;margin:0;padding:0; auto; }
#xinpin ul{list-style:none;}
#xinpin ul li{width:320px;height:360px;float:left;position:relative;}
#xinpin ul li img{border:10px solid #F5F5F5;-webkit-transition:1s ease;-moz-transition:1s ease;}
#xinpin .xinpininfo{width:200px;height:200px;border:10px solid #F5F5F5;background:#deddcd;position:absolute;bottom:-50px; margin-left: 50px; margin-right: 50px;-webkit-transition:1s ease;-moz-transition:1s ease;-moz-transform:rotatey(30deg);-webkit-transform:rotatey(30deg);}
#xinpin .xinpininfo h2{text-align:center;line-height:70px;color:#7a3f3a;font-weight:normal;font-size:20px;}
#xinpin .xinpininfo p{padding:0 20px;font-size:14px;}
#xinpin .xinpininfo a{display:block;width:100px;height:30px;background:#7a3f3a;color:#FFF;border-radius:5px;text-decoration:none;text-align:center;line-height:30px;margin:10px auto;}

#xinpin ul li:hover .info{-webkit-transform:rotatey(0deg);-moz-transform:rotatey(0deg);right:30px;bottom:-70px;}
#xinpin ul li:hover img{-webkit-transform:rotatey(360deg);-moz-transform:rotatey(360deg);}

.gonggaowrap{ width:1000px; margin:0 auto;}

#firstSolu{margin-left:50px;}
.solutions{width:1000px;overflow: hidden}
.solutions ul{width:1000px}
.solutions li{height:300px;background: #fff; width:263px;border:1px solid #e5e5e5;border-bottom: 5px solid #efefef; float:left; margin-right:20px; position:relative;}

.solutit{display: block;width:100%;}
.solutit img{ margin:30px auto;text-align: center;display: block;}
.solutit h4{color: #333;font-size: 16px;text-align: center;font-weight: bold;line-height: 30px;}
.solutit p{color: #72ac2d;line-height: 20px;font-size: 14px;text-align: center;}
.solutit a{line-height: 30px;height:30px;width: 100px;background: #72ac2d;color: #fff;font-size: 14px;font-weight: bold;text-align: center;display: block;margin:20px auto 0;border-radius: 5px;}
.solutit:hover a{background: #ec8000;}

.solutit2{width:223px;padding:0 20px;position:absolute;left:0px;top:0px;overflow: hidden;height:0px;background: #fff;z-index: 99;display: block;border-bottom:5px solid #72ac2d;}
.solutit2 h4{color: #333;font-weight: bold;font-size: 16px;line-height: 16px;margin-bottom: 10px;text-align: center;margin-top:40px;}
.solutit2 h5{text-align: center;color: #72ac2d;display: block;}
.solutit2 span{display: block;background: #bbbbbb;height:2px;width:50px;margin:10px auto;}
.solutit2 p{line-height: 24px;color: #666666;height:144px;display: block;overflow: hidden;}
</style>




<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
 
<script	src="js/jquery.smint.js" type="text/javascript" ></script>

<script type="text/javascript" src="js/jquery.roundabout.min.js"></script> 

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script> 
<script type="text/javascript" src="js/index.js" ></script>

<script type="text/javascript">		




$(document).ready(function($){ 


	$('#featured-area ul').roundabout({
	autoplayPauseOnHover: true,
		easing: 'easeOutInCirc',
		autoplay: true, 
		duration: 600,
		enableDrag: true

	});
	$(document).ready( function() {
    $('.subMenu').smint({
    	'scrollSpeed' : 1000
    });
});


});

</script>    
	
</head>
<body>

<div class="wrap ">
	<div class="section sTop">
		<div class="inner" >
	<h1 class="title">冠龙大卖场</h1>
			<h2 class="subtitle">冠龙大卖场卖的都是真的。 ———— 鲁迅</h2>
		<form  action="index.action" method="post" id="sitesearch" name="sitesearch" >
            <div class="search-wrapper" style="background-color:rgba(255,255,255,0); margin-top:250px; margin-left:330px;">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="Type to search" name="pname" id="searchtext"/>
                    <button class="search-icon" onclick="searchToggle(this, event);" type="submit"  style="background-color:#EEEEEE;"><span></span></button>
                </div>
                <span  style="background-color:#B7B7B7;"class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
        </form>
	
	<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
                  container.addClass('active');
                  evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                  container.removeClass('active');
                  // clear input
                  container.find('.search-input').val('');
                  // clear and hide result container when we press close
                  container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }

        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();

            _html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                _html = "找不到商品 :D";
            }

            $(obj).find('.result-container').html('<span>' + _html + '</span>');
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
        }
    </script>
		</div>
	</div>

	<div class="subMenu">
	 	<div class="inner">
	 		<a href="#sTop" class="subNavBtn">商城首页</a>
	 		<a href="#s1" class="subNavBtn">当季热销</a> 
			<a href="#s2" class="subNavBtn">新品上市</a>
			<a href="#s3" class="subNavBtn">热门分类</a>
			<a href="#s4" class="subNavBtn">商城公告</a>
			<c:if test="${shop.username==null}">
			<a href="login.jsp" class="subNavBtn extLink end">用户登录</a>
			<a href="register.jsp" class="subNavBtn">用户注册</a>
      		</c:if>
			<c:if test="${shop.username!=null}">
			<a href="indexmethod!userupdate.action" class="subNavBtn">个人信息</a>
			<a href="indexmethod!dingdanlist.action" class="subNavBtn">订单管理</a>
			</c:if>
			
		</div>
	</div>

	<div class="section s1">
		<div class="inner ">
			<h1>当季热销</h1>

<div id="featured-area"> 

	<ul> 
	<%
org.springframework.web.context.WebApplicationContext app2 = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());

shop.dao.CategoryDao categoryDao = (shop.dao.CategoryDao) app2.getBean("categoryDao");

List<shop.model.Category> catelist = categoryDao.selectBeanList(0,9999," where deletestatus=0 ");

%>
      <%

shop.dao.ProductDao productDao = (shop.dao.ProductDao) app2.getBean("productDao");

List<shop.model.Product> prolist = productDao.selectBeanList(0,6," where deletestatus=0 order by xiaoliang desc ");

%>
 <%
for(shop.model.Product pro:prolist){
 %>

        <li><a href="indexmethod!product.action?id=<%=pro.getId() %>" ><img src="uploadfile/<%=pro.getImgpath() %>"/></a></li> 

       	 <%
 }
 %>       
  
		<!--li><a href="index.action?type=1" ><span>推荐</span></a></li>

		<li><a href="http://www.jq22.com/"><span>PSD素材</span><img src="images/photoshop_plus.jpg" alt="PSD素材" /></a></li>  

		<li><a href="http://www.jq22.com/"><span>flash素材</span><img src="images/fnfast.jpg" alt="flash素材" /></a></li-->  

	</ul> 

</div>

		</div>
	</div>

	<div class="section s2">
		<div class="inner">
			<h1>新品上市</h1>
				<div id="xinpin">
				   <ul>
					   <li> <img src="img/adidas.png" alt="Iron Man 1" width="300" height="350" />
						  <div class="xinpininfo">
							 <h2>阿迪达斯</h2>
							 <p style="color:black;">NEO清爽一夏！ <br></br><br></br></p>
							 <a href="#">More info</a>
						  </div>
					   </li>
					   <li> <img src="img/wolf.png" alt="Iron Man 2" width="300" height="350" />
						  <div class="xinpininfo">
							 <h2>七匹马西服</h2>
							 <p style="color:black;">做男人就要七匹狼！<br></br><br></br></p>
							 <a href="#">More info</a>
						  </div>
					   </li>
					   <li> <img src="img/hai.png" alt="Iron Man 3" width="300" height="350" />
						  <div class="xinpininfo">
							 <h2>海澜之家</h2>
							 <p style="color:black;">海澜之家男人的衣柜！<br></br><br></br></p>
							 <a href="#">More info</a>
						  </div>
					   </li>
				   </ul>
				</div>
							
		</div>
	</div>



	<div class="section s3">
		<div class="inner">
			<h1>热门分类</h1>
				<div class="lest">
			<div class="box1">
				<a href="index.action?cateid=1"><img src="img/dishes.png" alt="" /></a>
			</div>
			<div class="box2">
				<a href="index.action?cateid=2"><img src="img/manes.png" alt="" /></a>
			</div>
			<div class="box3">
				<a href="index.action?cateid=3"><img src="img/foodes.png" alt="" /></a>
			</div>
			<div class="box4">
				<a href="index.action?cateid=4"><img src="img/housees.png" alt="" /></a>
			</div>
			<div class="box5">
				<a href="index.action?cateid=5"><img src="img/kites.png" alt="" /></a>
			</div>
			<div class="box6">
				<a href="index.action?cateid=6"><img src="img/jewes.png" alt="" /></a>
			</div>
				<div class="box7">
								<a href="index.action?cateid=7"><img src="img/elees.png" alt="" /></a>
							</div>
							<div class="box8">
								<a href="index.action?cateid=8"><img src="img/reades.png" alt="" /></a>
							</div>
		</div>
		</div>
	</div>

	<div class="section s4">
		<div class="inner">
			<h1>商城公告</h1>
			<div class='gonggaowrap'>
	<div class='solutions' id="solutions">
		<ul>
			 <li id = "firstSolu">
				<div class="solutit">
					<img src="images/safety.png">
					<h4>安全提醒</h4>
					<p>SAFETY WARNING</p>
					<a class="aaa" href="javascript:void(0)">了解详情</a>
				</div>
				<div class="solutit2">
					<h4>安全提醒</h4>
					<h5>SAFETY WARNING</h5>
					<span></span>
					<p>最近网上骗子很多，希望消费者注意安全，谨防诈骗。</p>
				</div>
			 </li>
			 <li>
				<div class="solutit">
					<img src="images/improve.png">
					<h4>网站升级提醒</h4>
					<p>IMPROVEMENT</p>
					<a class="aaa" href="javascript:void(0)">了解详情</a>
				</div>
				
				<div class="solutit2">
					<h4>网站升级提醒</h4>
					<h5>IMPROVEMENT</h5>
					<span></span>
					<p>考虑到广大消费者的需求，本网站近日全部升级，忘众多消费者周知。</p>
				</div>
			 </li>
			 <li>
				<div class="solutit">
					<img src="images/gift.png">
					<h4>假日好礼买就送</h4>
					<p>HOLIDAY REWARD</p>
					<a href="javascript:void(0)">了解详情</a>
				</div>
				
				<div class="solutit2">
					<h4>假日好礼买就送</h4>
					<h5>HOLIDAY REWARD</h5>
					<span></span>
					<p>正赶上近日是父亲节，商家大促销。</p>
				</div>
			 </li>
			
		</ul>
	</div>
</div>


<script type="text/javascript">
$(function(){
    $('#solutions li').click(function(){
    	$('#solutions .solutit2').stop().animate({
            height:'0'

        },600);
        $(this).find('.solutit2').stop().animate({
            height:'300'

        },600);
    });

});
</script>
		</div>
	</div>

	<div class="section s5" style="height: 80px;">
		<div class="inner">
		<h1 class="cl-effect-15"><a href="manage/login.jsp" data-hover="管理后台">管理后台</a></h1>
		</div>
	</div>

	
</div>



</body>
</html>
