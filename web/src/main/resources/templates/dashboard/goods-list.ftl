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

            <h2>商品列表</h2>
            <hr/>
            <div class="table-responsive">
                <div id="toolbar">
                    <div class="form-inline" role="form">
                        <a href="${ctx}/manager/add/goods" class="btn btn-primary">新增</a>
                    </div>
                </div>
                <table  data-toolbar="#toolbar"
                        data-toggle="table"
                        data-url="${ctx}/manager/list/goods/data"
                        data-pagination="true"
                        data-search="true">
                    <thead>
                    <tr>
                        <th data-sortable="true" data-field="goodsName">商品名称</th>
                        <th data-field="goodsDesc">商品描述</th>
                        <th data-field="reservePrice">竞拍价</th>
                        <th data-field="stock">库存</th>
                        <th data-field="fixedPrice">一口价</th>
                        <th data-field="fixed">允许一口价</th>
                        <th data-field="auction">允许竞拍</th>
                        <th data-field="obtained">是否下架</th>
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
        html += "<a href='${ctx}/manager/edit/goods/"+row.goodsId+"' class='btn btn-default'><i class='fas fa-edit'></i> 编辑</a>";
        html += "<a href='#' class='btn btn-default'><i class='fas fa-times'></i> 删除</a>";
        return html;
    }
</script>
</html>