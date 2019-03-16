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
<form class="form-register" method="post" action="/user/register" target="_self">
    <div class="text-center mb-4">
        <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    </div>

    <div class="form-label-group">
        <input type="text" id="inputNickName" class="form-control" name="nickName" onblur="checkUser(this)"
               placeholder="" required autofocus>
        <label for="inputNickName">用户名</label>
        <div class="invalid-username" style="color: #ff0000">
        </div>
    </div>

    <div class="form-label-group">
        <input type="email" id="inputEmail" class="form-control" name="email" placeholder="" required autofocus>
        <label for="inputEmail">邮箱</label>
    </div>

    <div class="form-label-group">
        <input type="text" id="inputMobile" class="form-control" name="mobile" placeholder="" required="">
        <label for="inputPassword">手机号</label>
    </div>

    <div class="form-label-group">
        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="" required="">
        <label for="inputPassword">密码</label>
    </div>

    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" id="save-info" name="agree" onchange="changeStatus(this)">
        <label class="custom-control-label" for="save-info"><a href="#" class="text-danger">同意用户隐私保护协议</a></label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit" id="submitBtn" disabled>注册</button>
    <p class="mt-5 mb-3 text-muted text-center">© 2017-2018</p>
</form>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script type="application/javascript">
    function submitClick() {
        document.getElementsByClassName('form-register').submit();
    }

    function changeStatus(obj) {
        document.getElementById('submitBtn').disabled = !obj.checked;
    }

    function checkUser(obj) {
        $.get("${ctx}/user/available/" + obj.value,
            function (data) {
                if (data !== true) {
                    document.getElementById('submitBtn').disabled = true;
                    obj.value = '';
                    $('.invalid-username')[0].innerHTML='用户已经存在';
                }
            });
    }
</script>
</html>