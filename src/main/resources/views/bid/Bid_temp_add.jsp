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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>填写订单</title>
</head>
<body>
<p align="center">订单信息填写</p>
<form action="Bid_bid.action?goodsid=<s:property value="#session.goods.goods_id"/>& prices=<%=request.getParameter("price")%>" method="post">
<table align="center">
	<tr>
		<td>商品编号：</td>
		<td><input type="text" id="goods_id" name="goods_id" value="<s:property value="#session.goods.goods_id"/>"/></td>
	</tr>
	<tr>
		<td>商品名称：</td>
		<td><input type="text" id="goods_name" name="goods_name" value="<s:property value="#session.goods.goods_name"/>"/></td>
	</tr>
	<tr>
		<td>买家姓名：</td>
		<td><input type="text" id="winner_name" name="winner_name" value="<s:property value="#session.user.nick_name"/>"/></td>
	</tr>
	<tr>
		<td>买家联系方式：</td>
		<td><input type="text" id="winner_phone" name="winner_phone"/></td>
	</tr>
	<tr>
		<td>拍卖价格：</td>
		<td><input type="text" id="price" name="price" value="<%=request.getParameter("price")%>"/></td>
	</tr>
	<tr>
		<td>收货地址：</td>
		<td><input type="text" id="address" name="address"/></td>
	</tr>
	<tr>
		<td>卖家姓名：</td>
		<td><input type="text" id="owner_name" name="owner_name" /></td>
	</tr>
	<tr>
		<td>卖家联系方式：</td>
		<td><input type="text" id="owner_phone" name="owner_phone" /></td>
	</tr>
	<tr>
		<td>备注：</td>
		<td><input type="text" id="bid_desc" name="bid_desc" /></td>
	</tr>
	<tr>
		<td><input type="submit" value="提交订单" /></td>
	</tr>
</table>
</form>
</body>
</html>