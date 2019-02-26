<!DOCTYPE html>
<html lang="zn_CH">
<#assign ctx=request.contextPath/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>易拍-用户注册</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body class="text-center login">
<form class="form-signin">
    <div class="text-center mb-4">
        <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    </div>

    <div class="form-label-group">
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
        <label for="inputEmail">用户名</label>
    </div>

    <div class="form-label-group">
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
        <label for="inputEmail">邮箱</label>
    </div>

    <div class="form-label-group">
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
        <label for="inputPassword">手机号</label>
    </div>

    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" id="save-info">
        <label class="custom-control-label" for="save-info"><a href="#" class="text-danger">同意用户隐私保护协议</a></label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
    <p class="mt-5 mb-3 text-muted text-center">© 2017-2018</p>
</form>
</body>
</html>