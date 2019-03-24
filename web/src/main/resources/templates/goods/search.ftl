<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>易拍</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav.ftl'>
<main role="main">
    <div class="container-fluid">
        <div class="row pl-xl-5">
            <#if goodsList??>
                <#list goodsList as goods>
                    <div class="col-md-3 card-deck">
                        <div class="card mb-4 shadow-sm">
                            <img src="${ctx}/${goods.album.mainPic!''}" alt="${goods.goodsName}" width="100%" height="225">
                            <div class="card-body">
                                <h5 class="card-title">${goods.goodsName}!''</h5>
                                <p class="card-text text-muted">${goods.goodsDesc!''}</p>
                                <div>
                                    <hr/>
                                    <ul class="list-group">
                                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                                            <div>
                                                <h6 class="my-0">竞拍底价￥：</h6>
                                            </div>
                                            <span class="text-muted">${goods.reservePrice!''}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between bg-light">
                                            <div class="text-success">
                                                <h6 class="my-0">一口价￥：</h6>
                                            </div>
                                            <span class="text-success">${goods.fixedPrice}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="btn-group justify-content-between align-items-center float-right" role="group">
                                    <button type="button" class="btn btn-sm btn-outline-dark">叫价</button>
                                    <button type="button" class="btn btn-sm btn-success">买入</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </#if>
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
</html>
