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

            <h2>我的订单</h2>
            <div class="table-responsive">

                <table class="text-nowrap"
                        data-toggle="table"
                        data-url="${ctx}/order/manager/list/order/data"
                        data-pagination="true"
                        data-search="true">
                    <thead>
                    <tr>
                        <th data-sortable="true" data-field="goods.goodsName">商品名称</th>
                        <th data-field="orderNo">订单号</th>
                        <th data-field="orderStatus" data-formatter="orderstatusFormatter">订单状态</th>
                        <th data-field="goods.goodsDesc">商品描述</th>
                        <th data-field="totalPrice">交易金额</th>
                        <th data-field="address.contact">收货人</th>
                        <th data-field="address.addr">收货地址</th>
                        <th data-field="address.contactPhone">收货人联系电话</th>
                        <th data-field="obtained" data-formatter="boolFormat">是否下架</th>
                        <th data-field="createDate">订单创建日期</th>
                        <th data-field="payDeadline">付款截至日期</th>
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
        if (row.orderStatus !== 4 && row.orderStatus !== 5 && row.orderStatus !== 3){
            return "<a href='#' class='btn btn-danger' onclick='doCancel("+row.id+")'><i class='fas fa-eye'></i> 取消</a>";
        }
    }
    function orderstatusFormatter(value, row, index) {
        switch (row.orderStatus) {
            case 0:
                return '待支付';
            case 1:
                return '待发货';
            case 2:
                return '待签收';
            case 3:
                return '交易关闭';
            case 4:
                return '交易取消';
            case 5:
                return '交易结束';
            default:
                return '交易处理中';
        }
    }
    function doCancel(obj) {
        $.get("${ctx}/order/oper/" + obj + "/2", function () {
            alert('订单已经取消');
            window.location.reload();
        })
    }
</script>
</html>
