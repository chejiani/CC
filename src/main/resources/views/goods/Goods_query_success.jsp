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
    <title>所有商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <center>
      <hr>
      <a href="<%=path%>/views.jsp">添加商品</a>
      <br>
      <br>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="6%"><b>商品编号</b></td>
        <td width="6%"><b>商品名称</b></td>
        <td width="6%"><b>商品类别</b></td>
        <td width="20%" align="center"><b>商品描述</b></td>
        <td width="13%"><b>拍卖起始时间</b></td>
        <td width="13%"><b>拍卖结束时间</b></td>
        <td width="10%"><b>起拍价</b></td>
        <td width="10%"><b>拍卖价</b></td>
        <td width="10%"><b>一口价</b></td>
        <td width="10%"><b>每次加价</b></td>
      </tr>
      <s:iterator var="goods" value="#session.goodsList" status="status">
        <tr>
         <td width="6%" align="center"><s:property value="#goods.goods_id"/></td>
         <td width="6%" align="left"><a href="<%=path%>/goods/Goods_modify.action?goodsid=<s:property value="#goods.goods_id"/>"><s:property value="#goods.goods_name"/></a></td>
         <td width="6%"><s:property value="#goods.goods_class"/></td>
         <td width="20%" align="center"><s:property value="#goods.goods_desc"/></td>
         <td width="13%"><s:date name="#goods.add_time" format="yyyy-MM-dd"/></td>
         <td width="13%"><s:date name="#goods.end_time" format="yyyy-MM-dd"/></td>
         <td width="10%"><s:property value="#goods.init_price"/></td>
         <td width="10%"><s:property value="#goods.bid_price"/></td>
         <td width="10%"><s:property value="#goods.max_price"/></td>
         <td width="10%"><s:property value="#goods.each_incr"/></td>
         <td width="20%">
           <a href="<%=path%>/goods/Goods_delete.action?goodsid=<s:property value="#goods.goods_id"/>" onclick="return confirm('确定要删除吗？\n\n该操作不可恢复！')">删除</a>
         </td>
        </tr>
      </s:iterator>
      </table>
      <br>
      <br>
      <a href="<%=path%>/views_success.jsp">返回首页</a>
    </center>  
  </body>
</html>
