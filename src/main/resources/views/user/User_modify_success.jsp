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
   	<meta charset="UTF-8">
	<title>修改</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link href="../../static/css/amazeui.min.css" rel="stylesheet"  />
	<link href="../../static/css/dlstyle.css" rel="stylesheet" type="text/css">
	<script src="../../static/js/jquery.min.js"></script>
	<script src="../../static/js/amazeui.min.js"></script>
	<script src="../../static/js/loginCheck.js" language="javascript" type="text/javascript"></script>
  </head>
  
  <body>
      	<div class="login-boxtitle">
			<a href="home/demo.html"><img alt="" src="../../static/images/logobig.png" /></a>
		</div>
	<div class="res-banner">
		<div class="res-main">
		 <div class="login-banner-bg"><span></span><img src="../../static/images/big.jpg" /></div>
			<div class="login-box">
					<div class="am-tabs" id="doc-my-tabs">
						<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
							<center>修改</center>
						</ul>
					<form action="User_save.action?userid=<s:property value="#session.mod_user.user_id"/>" method="post">
					<!--	 <a href="User_save.action?userid=<s:property value="#session.mod_user.user_id"/>">	 -->			
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
	
						<div class="user-email">
						  <div>
							<label for="email"><i class="am-icon-envelope-o"></i></label>
							<input type="text" name="nick_name" id="nick_name" placeholder="请输入账号名称">
						  </div>
						  <div id="nick"> </div>
						</div>									
                		 <div class="user-pass">
                		  <div>
							<label for="password"><i class="am-icon-lock"></i></label>
							<input type="password" name="password" id="password" onblur="checkPW()" placeholder="设置密码" >
               			  </div>
               				<div id="pwd"> </div>
               			 </div>										
                		<div class="user-pass">
						  <div>	
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="password" name="passwordRepeat" id="passwordRepeat" onblur="checkRPW()" placeholder="确认密码">
                		  </div>
                		  <div id="rpwd"> </div>
                		</div>
                		<div class="user-pass">
                		  <div>
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="text" name="real_name" id="real_name" placeholder="真实姓名">
                		  <div>
                		  <div id="real"> </div>
                		</div>
                		<div class="user-pass">
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="text" name="gender" id="gender" placeholder="性别">
                		</div>
                		<div class="user-pass">
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="text" name="department" id="department" placeholder="院系">
                		</div>
                		<div class="user-pass">
						  <div>	
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="text" name="mobile" id="mobile" placeholder="手机号">
                		  </div>
                		  <div id="mb"> </div>
                		</div>
                		<div class="user-pass">
                		  <div>
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="text" name="address" id="address" placeholder="住址">
						  </div>
						  <div id="addr"> </div>
                		</div>
						<div class="am-cf">
							<input type="submit" name="" value="保存"  class="am-btn am-btn-primary am-btn-sm am-fl">
						</div>
						</div>
						</div>
				  	</div>
				  </form>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
