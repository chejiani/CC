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
    <link href="${ctx}/css/datatables.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav.ftl'>
<main role="main">
    <div class="container-fluid">
        <div class="row justify-content-center pb-4">
            <div class="col-lg-10">
                <h4>填写并确认订单</h4>
                <hr/>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-7 px-lg-5">
                <form novalidate>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">姓</label>
                            <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                            <div class="invalid-feedback">

                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">名</label>
                            <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                            <div class="invalid-feedback">

                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email">账号 <span class="text-muted">(Optional)</span></label>
                        <input type="email" class="form-control" id="email" placeholder="you@example.com">
                        <div class="invalid-feedback">

                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">收货地址</label>
                        <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                        <div class="invalid-feedback">
                            Please enter your shipping address.
                        </div>
                    </div>

                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="protocol">
                        <label class="custom-control-label" for="protocol"><a href="#" class="text-danger">同意竞拍协议</a> </label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="save-info">
                        <label class="custom-control-label" for="save-info">保存地址下次使用</label>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block" id="buy_click" disabled type="submit">确认</button>
                </form>
            </div>
            <div class="col-lg-3 w-75">
                <div class="card" style="width: 18rem;">
                    <a href="/details/${goods.goodsId}">
                        <img alt="" src="${ctx}/asset/1.svg" width="100%" height="225">
                    </a>
                    <div class="card-body">
                        <a href="/details/222" class="text-info text-decoration-none">
                            <h6 class="card-title">${goods.goodsName}</h6>
                        </a>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-dark">
                                    <h6 class="my-0">一口价￥：</h6>
                                </div>
                                <span class="text-success">${goods.fixedPrice}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-dark">
                                    <h6 class="my-0">竞拍底价￥：</h6>
                                </div>
                                <span class="text-success">${goods.reservePrice}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-dark ">
                                    <h6 class="my-0">当前竞拍价￥：</h6>
                                </div>
                                <span class="text-success">20</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<#include '../common/footer.ftl'>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/js/cjn.js"></script>
<script>
    $(function () {
        $('#buy_click').click(function () {
            alert('支付成功');
        })
    });
    function protocolClick() {
        $('#buy_click').disabled = !$(this).checked;
    }
</script>
</html>