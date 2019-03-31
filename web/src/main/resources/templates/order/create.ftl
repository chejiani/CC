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
                <form novalidate method="post" action="${ctx}/order/create">
                    <input type="hidden" value="${goods.goodsId}" name="goodsId"/>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">联系人：</label>
                            <input type="text" class="form-control" id="firstName" name="contact" placeholder="" value="" required="">
                            <div class="invalid-feedback">

                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">联系电话:</label>
                            <input type="text" class="form-control" id="lastName" name="contactPhone" placeholder="" value="" required="">
                            <div class="invalid-feedback">

                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">收货地址</label>
                        <input type="text" class="form-control" name="addr" id="address" placeholder="1234 Main St" required="">
                        <div class="invalid-feedback">
                            Please enter your shipping address.
                        </div>
                    </div>

                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="protocol" onclick="protocolClick(this)">
                        <label class="custom-control-label" for="protocol"><a href="#" class="text-danger">同意竞拍协议</a> </label>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block" id="buy_click" disabled type="submit">确认</button>
                </form>
            </div>
            <div class="col-lg-3 w-75">
                <div class="card" style="width: 18rem;">
                    <a href="${ctx}/details/${goods.goodsId}">
                        <#if goods.album??>
                            <img alt="" src="${ctx}/${goods.album.mainPic!''}" width="100%" height="225">
                            <#else >
                                <img alt="" src="#" width="100%" height="225">
                        </#if>
                    </a>
                    <div class="card-body">
                        <a href="${ctx}/details/${goods.goodsId}" class="text-info text-decoration-none">
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
                                    <h6 class="my-0">当前库存￥：</h6>
                                </div>
                                <span class="text-success">${goods.stock}</span>
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
<script src="${ctx}js/popper.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/js/cjn.js"></script>
<script>
    function protocolClick(obj) {
        var btn = $('#buy_click')[0];
        btn.disabled = !obj.checked;
    }
</script>
</html>
