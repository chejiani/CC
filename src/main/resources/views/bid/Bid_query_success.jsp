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

  </head>
  
  <body>
    <center>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="6%"><b>订单编号</b></td>
        <td width="6%"><b>买家姓名</b></td>
        <td width="6%"><b>买家联系方式</b></td>
        <td width="20%" align="center"><b>成交价格</b></td>
        <td width="13%"><b>交易地点</b></td>
        <td width="13%"><b>订单生成时间</b></td>
        <td width="10%"><b>卖家姓名</b></td>
        <td width="10%"><b>卖家联系方式</b></td>
        <td width="10%"><b>订单状态</b></td>
        <td width="10%"><b>备注</b></td>
      </tr>
      <s:iterator var="bid" value="#session.bid_list" status="status">
        <tr>
         <td width="6%" align="center"><s:property value="#bid.bid_id"/></td>
         <td width="6%" align="left"><s:property value="#bid.winner_name"/></a></td>
         <td width="6%"><s:property value="#bid.winner_phone"/></td>
         <td width="20%" align="center"><s:property value="#bid.price"/></td>
         <td width="13%"><s:property value="#bid.address"/></td>
         <td width="13%"><s:date name="#bid.bid_time" format="yyyy-MM-dd"/></td>
         <td width="10%"><s:property value="#bid.owner_name"/></td>
         <td width="10%"><s:property value="#bid.owner_phone"/></td>
         <td width="10%"><s:property value="#bid.bid_state"/></td>
         <td width="10%"><s:property value="#bid.bid_desc"/></td>
         <td width="20%">
           <a href="<%=path%>/bid/Bid_delete.action?bidid=<s:property value="#bid.bid_id"/>" onclick="return confirm('确定要删除吗？\n\n该操作不可恢复！')">删除</a>
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
