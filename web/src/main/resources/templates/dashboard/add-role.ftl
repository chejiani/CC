<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>易拍平台管理系统</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/datatables.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wangEditor/wangEditor.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/bootstrap-fileinput/themes/theme.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav-dashboard.ftl'>
<main role="main" class="container-fluid">
    <div class="row">
        <#include '../common/siderbar.ftl'>

        <div class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="container-fluid">
                <h2>添加新角色</h2>
                <hr/>
                <div class="row justify-content-center">
                    <div class="col-lg-11">
                        <form id="goods-form" class="needs-validation" method="post" action="${ctx}/user/manager/add/role"
                              novalidate="" target="_parent">
                            <div class="mb-3">
                                <label for="name">角色名称</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="name" id="name"
                                           placeholder="user"
                                           required="">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="username">角色描述</label>
                                <div class="input-group">
                                    <textarea class="form-control" name="description"
                                              aria-label="With textarea"></textarea>
                                </div>
                            </div>
                            <hr class="mb-4">
                            <button class="btn btn-primary btn-lg btn-block">提交</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/wangEditor/wangEditor.min.js"></script>
<script src="${ctx}/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="${ctx}/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="${ctx}/bootstrap-fileinput/themes/theme.min.js"></script>
<script src="${ctx}/js/cjn.js"></script>
</html>