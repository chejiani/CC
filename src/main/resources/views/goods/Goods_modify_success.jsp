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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<title>add goods</title>
</head>
<body>
<form action="Goods_save.action" method="post">
	<table>
	<tr>
		<td>商品编号：</td>
		<td><input type="text" name="goods_id" value="<s:property value="#session.mod.goods_id"/>"/></td>
	</tr>
	<tr>
		<td>商品名称：</td>
		<td><input type="text" name="goods_name" value="<s:property value="#session.mod.goods_name"/>"/></td>
	</tr>
	<tr>
		<td>商品分类：</td>
		<td><input type="text" name="goods_class" value="<s:property value="#session.mod.goods_class"/>"/></td>
	</tr>
	<tr>
		<td>商品描述：</td>
		<td><input type="text" name="goods_desc" value="<s:property value="#session.mod.goods_desc"/>"/></td>
	</tr>
	<tr>
		<td>起拍时间：</td>
		<td><input type="text" name="add_time" value="<s:date name="#session.mod.add_time" format="yyyy-MM-dd HH:mm:ss"/>"/></td>
	</tr>
	<tr>
		<td>截止时间：</td>
		<td><input type="text" name="end_time" value="<s:date name="#session.mod.end_time" format="yyyy-MM-dd HH:mm:ss"/>"/></td>
	</tr>
	<tr>
		<td>起拍价：</td>
		<td><input type="text" name="init_price" value="<s:property value="#session.mod.init_price"/>"/></td>
	</tr>
	<tr>
		<td>拍卖价：</td>
		<td><input type="text" name="bid_price" value="<s:property value="#session.mod.bid_price"/>"/></td>
	</tr>
	<tr>
		<td>一口价：</td>
		<td><input type="text" name="max_price" value="<s:property value="#session.mod.max_price"/>"/></td>
	</tr>
	<tr>
		<td>每次加价：</td>
		<td><input type="text" name="each_incr" value="<s:property value="#session.mod.each_incr"/>"/></td>
	</tr>

	<tr>
		<td>接单区域：</td>
		<td><input type="text" name="bid_area" value="<s:property value="#session.mod.bid_area"/>"/></td>
	</tr>
	<tr>
		<td><input type="submit" value="保存"></td>
	</tr>
	</table>
</form>
</body>
</html>