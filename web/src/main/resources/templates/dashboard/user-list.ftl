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
    <link href="${ctx}/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav-dashboard.ftl'>
<main role="main" class="container-fluid">
    <div class="row">
        <#include '../common/siderbar.ftl'>
        <div class="col-md-9 ml-sm-auto col-lg-10 px-4">

            <h2>用户列表</h2>
            <hr/>
            <div class="table-responsive">
                <table
                        data-toggle="table"
                        data-url="${ctx}/user/manage/list/user/data"
                        data-pagination="true"
                        data-search="true">
                    <thead>
                    <tr>
                        <th data-sortable="true" data-field="nickName">昵称</th>
                        <th data-field="realName">实名</th>
                        <th data-field="gender">性别</th>
                        <th data-field="mobile">电话号码</th>
                        <th data-field="address">通讯地址</th>
                        <th data-field="disable">是否禁用</th>
                        <th data-field="createDateTime">创建日期</th>
                        <th data-field="updateDateTime">上次更新日期</th>
                        <th data-field="operation" data-formatter="operateFormatter">操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</main>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctx}/js/cjn.js"></script>
<script type="application/javascript">
    function operateFormatter(value, row, index) {
        var html = "<a href='${ctx}/details/"+row.goodsId+"' class='btn btn-default'><i class='fas fa-eye'></i> 查看</a>"
        html += "<a href='#' class='btn btn-default'><i class='fas fa-edit'></i> 编辑</a>";
        html += "<a href='#' class='btn btn-default'><i class='fas fa-times'></i> 删除</a>";
        return html;
    }
</script>
</html>