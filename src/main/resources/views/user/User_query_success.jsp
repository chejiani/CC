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
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
      <h1>登录成功！</h1>
      <hr>
      <a href="<%=path%>/user/User_add.jsp">添加学生</a>
      <br>
      <br>
      <table width="800"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="20%"><b>编号</b></td>
        <td width="20%"><b>姓名</b></td>
        <td width="20%"><b>性别</b></td>
        <td width="20%"><b>删除</b></td>
      </tr>
      <s:iterator var="stus" value="#session.stu_list" status="status">
        <tr>
         <td width="20%"><s:property value="#stus.sid"/></td>
         <td width="20%"><a href="<%=path%>/students/Students_modify.action?stu_id=<s:property value="#stus.sid"/>"><s:property value="#stus.sname"/></a></td>
         <td width="20%"><s:property value="#stus.gender"/></td>
         <td width="20%">
           <a href="<%=path%>/students/Students_delete.action?stu_id=<s:property value="#stus.sid"/>" onclick="return confirm('确定要删除吗？\n\n该操作不可恢复！')">删除</a>
         </td>
        </tr>
      </s:iterator>
      </table>
      <br>
      <br>
      <a href="<%=path%>/index.jsp">返回登录</a>
    </center>  
  </body>
</html>
