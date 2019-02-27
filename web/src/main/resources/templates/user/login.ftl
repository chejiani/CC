<!DOCTYPE html>
<html lang="zn_CH">
<#assign ctx=request.contextPath/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>易拍-用户登录</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body class="text-center login">
<form class="form-signin" method="post">
    <div class="text-center mb-4">
        <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    </div>

    <div class="form-label-group">
        <input type="text" id="inputEmail" class="form-control" name="username" placeholder="" required="" autofocus="">
        <label for="inputEmail">用户</label>
    </div>

    <div class="form-label-group">
        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required="">
        <label for="inputPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me" name="rememberMe"> Remember me
        </label>
        <label>
            <a href="/user/register" class="btn-link btn text-primary">没有账户</a>
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted text-center">© 2017-2018</p>
</form>
</body>
</html>