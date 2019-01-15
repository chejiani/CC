<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<title>管理员登录</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link href="../../static/css/amazeui.css" rel="stylesheet" />
	<link href="../../static/css/dlstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="login-boxtitle">
			<a href="home.html"><img alt="logo" src="../../static/images/logobig.png" /></a>
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="../../static/images/big.jpg" /></div>
				<div class="login-box">
					<h3 class="title">管理员登录</h3>
					<form action="Admin_login.action" method="post">
					  <div class="login-form">
							<div class="user-name">
							    <label for="user"><i class="am-icon-user"></i></label>
							    <input type="text" name="admin_name" id="admin_name" placeholder="用户名" />
							</div>
                			<div class="user-pass">
							    <label for="password"><i class="am-icon-lock"></i></label>
							    <input type="password" name="admin_password" id="admin_password" placeholder="请输入密码" />
               				</div>
           			  </div>
           		 	 <div class="login-links">
						 <a href="register.html" class="zcnext am-fr am-btn-default">注册</a>
						<br/>
           			 </div>
					 <div class="am-cf">
						<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
				 </div>	
				</form>
			</div>
			
		  </div>
		</div>
</body>
</html>