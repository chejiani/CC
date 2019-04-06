<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<#assign seq = ["foo", "bar", "baz", "qwe", "foo"]>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>首页</title>

    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include 'common/nav.ftl'>
<main role="main">
    <div id="carousel" class="carousel slide mb-5" data-ride="carousel">
        <ol class="carousel-indicators">
            <#list seq as i>
                <#if i == "baz">
                    <li data-target="#carousel" data-slide-to="0" class="index"></li>
                <#else >
                    <li data-target="#carousel" data-slide-to="${i?index}" class=""></li>
                </#if>
            </#list>
            <li data-target="#carousel" data-slide-to="0" class=""></li>
            <li data-target="#carousel" data-slide-to="1" class="active"></li>
            <li data-target="#carousel" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner">
            <#list seq as i>
                <#if i == "baz">
                    <div class="carousel-item active">
                        <img alt="江西农业大学校园竞拍系统正式上线" src="${ctx}asset/8289e008-3538-4fe7-b98e-5a9517dd662c.png"
                             width="100%" height="400">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>江西农业大学校园竞拍系统正式上线</h5>
                            <p>江西农业大学校园竞拍系统正式上线使用，欢迎广大师生使用，增加资源利用率，让自己的闲置物品找回价值</p>
                        </div>
                    </div>
                <#else>
                    <div class="carousel-item">
                        <img alt="江西农业大学校园竞拍系统正式上线" src="${ctx}asset/8289e008-3538-4fe7-b98e-5a9517dd662c.png"
                             width="100%" height="400">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>江西农业大学校园竞拍系统正式上线</h5>
                            <p>江西农业大学校园竞拍系统正式上线使用，欢迎广大师生使用，增加资源利用率，让自己的闲置物品找回价值</p>
                        </div>
                    </div>
                </#if>

            </#list>
        </div>
        <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container-fluid">
        <div class="row pl-xl-5">
            <#list goodsList as s>
                <div class="col-md-3 card-deck">
                    <div class="card mb-4 shadow-sm">
                        <a href="/details/${s.goodsId}">
                            <#if s.album??>
                                <img alt="" src="${ctx}/${s.album.mainPic!''}" width="100%" height="225">
                            <#else >
                                <img alt="" src="#" width="100%" height="225">
                            </#if>
                        </a>
                        <div class="card-body">
                            <a href="/details/${s.goodsId}">
                                <h5 class="card-title text-info">${s.goodsName}</h5>
                            </a>
                            <p class="card-text text-muted">${s.goodsDesc}</p>
                            <div>
                                <hr/>
                                <ul class="list-group">
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                        <div>
                                            <h6 class="my-0">当前竞拍价￥：</h6>
                                        </div>
                                        <span class="text-muted">${s.reservePrice}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between bg-light">
                                        <div class="text-success">
                                            <h6 class="my-0">一口价￥：</h6>
                                        </div>
                                        <span class="text-success">${s.fixedPrice}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="btn-group justify-content-between align-items-center float-right" role="group">
                                <a href="#" goods_no="${s.goodsId}" class="btn btn-sm btn-outline-dark bid_click">叫价</a>
                                <a href="${ctx}/order/create/${s.goodsId}" class="btn btn-sm btn-success">买入</a>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</main>
<#include 'common/footer.ftl'>
</body>
<script src="${ctx}js/jquery-3.1.1.min.js"></script>
<script src="${ctx}js/popper.min.js"></script>
<script src="${ctx}js/bootstrap.min.js"></script>
<script src="${ctx}js/bootstrap.bundle.min.js"></script>
<script src="${ctx}js/cjn.js"></script>
</html>
