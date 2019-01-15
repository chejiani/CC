<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的订单</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="../../static/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../../static/css/admin.css" rel="stylesheet" type="text/css" />

	<link href="../../static/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../../static/css/hmstyle.css" rel="stylesheet" type="text/css"/>
	<link href="../../static/css/skin.css" rel="stylesheet" type="text/css" />
	<script src="../../static/js/jquery.min.js"></script>
	<script src="../../static/js/amazeui.min.js"></script>
	<link href="../../static/css/Admin1.css" rel=stylesheet>
	<script language=javascript src="../../static/js/Admin.js"></script>
	
	<style type=text/css>.style1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
	}
	</style>
  </head>
  
  <body>
  		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
			<s:iterator var="user" value="#session.user_list" status="status"></s:iterator>
				<ul class="message-r">
					<div class="topMessage"></div>
					<div class="topMessage home">
						<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
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
				<div class="logo">
						<li><img src="../../static/images/logo.png"/></li>
					</div>
					<div class="logoBig">
						<li><img src="../../static/images/logobig.png"/></li>
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

  <br><center>
<table class=tableborder cellSpacing=1 cellPadding=3 width="80%" align=center border=0>
</table><br>
<table cellSpacing=0 cellPadding=0 width="80%" align=center bgColor=#6ab6b6 border=0>
 <tbody>
 <s:iterator var="bid" value="#session.bid_list" status="status">
  <tr>
    <td colSpan=9 height=24>【订单列表】</td>  
  </tr>
  <tr>
    <td class=forumrow>订单编号</td>
    <td class=forumrow><s:property value="#bid.bid_id"/></td>
  </tr>
  
  <tr>
    <td class=forumrow>商品名称</td>
    <td class=forumrow><s:property value="#bid.goods_name"/></td>
  </tr>
  <tr>
  <td class=forumrow>提交订单时间</td>
  <td class=forumrow><s:date name="#bid.bid_time" format="yyyy-MM-dd HH:mm:ss"/></td>
  </tr>
  <tr>
  <td class=forumrow>成交价格</td>
  <td class=forumrow>＄<s:property value="#bid.price"/></td>
  </tr>
  <tr>
  <td class=forumrow>交易地点</td>
  <td class=forumrow><s:property value="#bid.address"/></td>
  </tr>
  <tr>
  <td class=forumrow>卖家姓名</td>
  <td class=forumrow><s:property value="#bid.owner_name"/></td>
  </tr>
  <tr>
  <td class=forumrow>卖家联系方式</td>
  <td class=forumrow><s:property value="#bid.owner_phone"/></td>
  </tr>
  <tr>
  <td class=forumrow>订单状态</td>
  <td class=forumrow><s:property value="#bid.bid_state"/></td>
  </tr>
  <tr>
  <td class=forumrow>备注</td>
  <td class=forumrow><s:property value="#bid.bid_desc"/></td>
  </tr>
  <tr>
  <td class=forumrow>操作</td>
  <td class=forurow>
	    <a href="<%=path%>/bid/Bid_cancel.action?bidid=<s:property value="#bid.bid_id"/>">取消订单</a>
	    <a href="<%=path%>/bid/Bid_delete.action?bidid=<s:property value="#bid.bid_id"/>">删除订单</a>
    </td>
  </tr>
  </s:iterator>
   <!--   
    <td class=forumrow><s:property value="#bid.winner_name"/></td>
    <td class=forumrow><s:property value="#bid.winner_phone"/></td>
	-->
  </tbody>
  </table>
  </center>
  </body>
  </html>
