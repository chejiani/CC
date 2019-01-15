<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<title>首页</title>

	<link href="../../static/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../../static/css/admin.css" rel="stylesheet" type="text/css" />

	<link href="../../static/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../../static/css/hmstyle.css" rel="stylesheet" type="text/css"/>
	<link href="../../static/css/skin.css" rel="stylesheet" type="text/css" />
	
	<link href="../../static/css/seastyle.css" rel="stylesheet" type="text/css" />
	<script src="../../static/js/jquery.min.js"></script>
	<script src="../../static/js/amazeui.min.js"></script>

	
</head>
<body>

	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
		<s:iterator var="user" value="#session.user_list" status="status"></s:iterator>
			<ul class="message-r">
				<div class="topMessage"></div>
				<div class="topMessage home">
					<div class="menu-hd"><a href="<%=path%>/views_success.jsp" target="_top" class="h">商城首页</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<!-- 登陆用户信息 -->
					<div><a href="User_modify.action?userid=<s:property value="#session.user.user_id"/>"><s:property value="#session.user.nick_name"/></a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="<%=path%>/goods/Goods_query.action" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>商品信息</span></a></div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="<%=path%>/bid/Bid_search.action?username=<s:property value="#session.user.nick_name"/>" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a></div>
			</ul>
		</div>
	
			<!--悬浮搜索框-->
	
		<div class="nav white">
			<div class="logo"><img src="../../static/images/logo.png" /></div>
			<div class="logoBig">
				<li><img src="../../static/images/logobig.png" /></li>
			</div>
	
			<div class="search-bar pr">
				<form action="<%=path%>/goods/Goods_search.action" method="post">
					<input id="goodsname" name="goodsname" type="text" placeholder="搜索" autocomplete="off">
					<a><input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit"></a>
				</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>

	
	<div class="shopNav">
		<div class="slideall">
		   <div class="long-title"><span class="all-goods">全部分类</span></div>
		   <div class="nav-cont">
				<ul>
					<li class="index"><a href="<%=path%>/views_success.jsp">首页</a></li>
                     <li class="qc"><a href="<%=path%>/goods/Goods_search.action">今日拍卖</a></li>
                     <li class="qc"><a href="<%=path%>/goods/Goods_myGoods.action?ownerName=<s:property value="#session.user.nick_name"/>">我的拍卖</a></li>
                     <li class="qc"><a href="#">我的竞拍</a></li>
                     <li class="qc"><a href="<%=path%>/views>用户登录</a></li>
                     <li class="qc last"><a href="<%=path%>/viewssp">用户注册</a></li>
				</ul>
			</div>					
	
			<!--走马灯 -->

			<div class="clear"></div>
		</div>
		
	</div>
	<div class="banner">
              <!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.html"><img src="../../static/images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img src="../../static/images/ad21.jpg" /></a></li>
				<li class="banner3"><a><img src="../../static/images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img src="../../static/images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>	
		<div>
		<a class="box1" href="Goods_query.action">热销商品</a>
		
		<div class="am-g am-g-fixed">
					<div class="am-u-sm-12 am-u-md-12">
                  		<div class="theme-popover">
							<div class="clear"></div>
                       </div>
						<div class="search-content">
							<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
								<s:iterator var="search" value="#session.goodsList" status="status">
								<li>
									<div class="i-pic limit">
									<a href="<%=path%>/goods/Goods_detail.action?goodsid=<s:property value="#search.goods_id"/>" target="_top" class="h">
										<img src="<%=request.getContextPath()%>/<s:property value="#search.goods_picture"/>" />											
										<p class="title fl"><s:property value="#search.goods_desc"/>&nbsp;<s:property value="#search.goods_class"/></p>
										<center><p class="price fl"><s:property value="#search.goods_name"/></p></center>
										
										<p class="price fl">
											<b>¥</b>
											<strong >起拍价:<s:property value="#search.init_price"/></strong><br>
											<b>¥</b>
											<strong>一口价:<s:property value="#search.max_price"/></strong>
										</p>
										<p class="number f1">
											起拍时间:<span><s:date name="#search.add_time" format="yyyy-MM-dd HH:mm:ss"/></span>
										</p>
										<p class="number f1">
											截止时间:<span><s:date name="#search.end_time" format="yyyy-MM-dd HH:mm:ss"/></span>
										</p>
										<p class="number f1">
											商品状态:<span><s:property value="#search.goods_state"/></span>
										</p>
										</a>
									</div>
								</li>
								</s:iterator>
							</ul>
						</div>
						<div class="clear"></div>
						<!--分页 -->
						<ul class="am-pagination am-pagination-right">
							<li class="am-disabled"><a href="#">&laquo;</a></li>
							<li class="am-active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>

					</div>
				</div>
		</div>
	</div>
	
	<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop: "-39px"
					}, 500, function() {
						$(this).css({
							marginTop: "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</body>
</html>