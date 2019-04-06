<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>易拍-我的订单</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav.ftl'>
<main role="main">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-10">
                <table
                        data-toggle="table"
                        data-url="${ctx}/order/list/data"
                        data-pagination="true"
                        data-search="true">
                    <thead>
                    <tr>
                        <th data-field="orderNo">订单号</th>
                        <th data-sortable="true" data-field="goods.goodsName">商品名称</th>
                        <th data-field="goods.goodsDesc">商品描述</th>
                        <th data-field="goods.reservePrice">竞拍底价</th>
                        <th data-field="totalPrice">买入价</th>
                        <th data-field="orderStatus" data-formatter="orderstatusFormatter">交易状态</th>
                        <th data-field="operation" data-formatter="operateFormatter">操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</main>
<#include '../common/footer.ftl'>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctx}/js/cjn.js"></script>
<script type="application/javascript">
    function operateFormatter(value, row, index) {
        var html = '';
        if (row.orderStatus === 0){
            html = "<a href='#' class='btn btn-default' onclick='doCancel("+row.id+")'><i class='fas fa-eye'></i> 取消</a>";
            return html + "<a href='${ctx}/supplement" + row.id+"' class='btn btn-default'><i class='fas fa-eye'></i> 补充地址</a>";
        } else if (row.orderStatus === 1){
            html = "<a href='#' class='btn btn-default' onclick='doCancel("+row.id+")'><i class='fas fa-eye'></i> 取消</a>";
            return html + "<a href='#' class='btn btn-default' onclick='doPay("+row.id+")'><i class='fas fa-eye'></i> 付款</a>";
        } else if (row.orderStatus === 2) {
            return html + "<a href='#' class='btn btn-default' onclick='doCancel(\"+row.id+\")'><i class='fas fa-eye'></i> 取消</a>";
        }
    }

    function doCancel(obj) {
        $.get("${ctx}/order/oper/" + obj + "/2", function () {
            alert('订单已经取消');
            window.location.reload();
        })
    }
    function doPay(obj) {
        $.get("${ctx}/order/oper/" + obj + "/1", function () {
            alert('付款成功');
            window.location.reload();
        })
    }
    function doSupplement(obj) {
        $.get("${ctx}/supplement/" + obj, function () {
            window.location.reload();
        })
    }
    function orderstatusFormatter(value, row, index) {
        switch (row.orderStatus) {
            case 0:
                return '待补充地址';
            case 1:
                return '待支付';
            case 2:
                return '待发货';
            case 3:
                return '待签收';
            case 4:
                return '交易关闭';
            case 5:
                return '交易取消';
            default:
                return '交易结束';
        }
    }
</script>
</html>
