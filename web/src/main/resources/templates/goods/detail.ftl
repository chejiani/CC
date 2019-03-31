<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>易拍</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav.ftl'>
<main role="main">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <#-- 图片展示区 -->
            <div class="col-4 justify-content-center shadow-lg">
                <div class="p-5 bg-transparent">
                    <#if albums??>
                        <div class="show-img" id="big-img" href="${ctx}/${albums[0]}">
                            <img src="${ctx}/${albums[0]}" id="show-img" alt="${albums[0]}">
                        </div>
                    </#if>
                    <div class="small-img">
                        <img src="${ctx}/asset/online_icon_right@2x.png" class="icon-left" alt="" id="prev-img">
                        <div class="small-container">
                            <div id="small-img-roll">
                                <#if albums??>
                                    <#list albums as album>
                                        <img src="${ctx}/${album}" class="show-small-img" alt="${album}">
                                    </#list>
                                </#if>
                            </div>
                        </div>
                        <img src="${ctx}/asset/online_icon_right@2x.png" class="icon-right" alt="" id="next-img">
                    </div>
                </div>
            </div>
            <#-- 价格简介区 -->
            <div class="col-4">
                <div class="m-2">
                    <div class="card w-100">
                        <div class="card-body">
                            <h4 class="card-title">${goods.goodsName}</h4>
                            <p class="card-text text-info">${goods.goodsDesc}</p>
                            <div>
                                <hr/>
                                <div class="bg-transparent">
                                    <div>
                                        <h6 class="text-dark">当前竞拍信息:</h6>
                                        <table class="table">
                                            <thead class="thead-light">
                                            <tr>
                                                <th scope="col">底价</th>
                                                <th scope="col">当前出价</th>
                                                <th scope="col">竞拍人数</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>${goods.reservePrice}</td>
                                                <td class="text-danger">135.00</td>
                                                <td>3</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="bg-transparent">
                                    <h6 class="text-dark">一口价:<span class="text-danger">${goods.fixedPrice}</span></h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="btn-group justify-content-between align-items-center float-right" role="group">
                                <button type="button" goods_no="${goods.goodsId}"
                                        class="btn btn-lg btn-outline-dark p-1 bid_click">叫价
                                </button>
                                <a type="button" href="/order/create/${goods.goodsId}" class="btn btn-lg btn-success p-1">
                                    买入
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
        <#-- 详细信息区 -->
        <div class="row justify-content-center">
            <div class="col-9 p-1 border">
                ${goods.article}
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
</html>
