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
<script type="text/javascript" src="../../static/js/jquery-1.7.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>竞拍出价</title>
</head>
<body>
		<table>
			<tr><td>商品起拍价：<s:property value="#session.goods.init_price"/></td></tr>
			<tr><td>当前拍卖价：<s:property value="#session.goods.bid_price"/></td></tr>
			<tr><td>每次加价不能少于：<s:property value="#session.goods.each_incr"/>元<!--<s:property value="#session.goods.init_price"/>--></td></tr>
			<tr><td><input type="text" id="bidprice" name="bidprice"></td></tr>
			<tr><td><input type="button" value="出价" id="bidding" name=bidding onclick="fun()"></td></tr>
		</table>
		
		<script type="text/javascript">
		function fun(){
			var money =$("#bidprice").val();
			if(money < <s:property value="#session.bid.price"/>+<s:property value="#session.goods.each_incr"/>)
				alert("出价金额不符合要求");
			else
				parent.jump(money);
		}
	</script>
</body>
</html>