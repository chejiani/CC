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
<header>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <h5 class="my-0 mr-md-auto font-weight-normal">易拍</h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="#">我的购物车</a>
            <a class="p-2 text-dark" href="#">客服</a>
        </nav>
        <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="搜索关键字" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">找找看</button>
        </form>
        <a class="btn btn-link text-justify text-info" href="#">登陆</a>
    </div>
</header>
<main role="main">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <#-- 图片展示区 -->
            <div class="col-4 justify-content-center shadow-lg">
                <div class="m-5 bg-transparent">
                    <div class="show border border-info" href="${ctx}/asset/1.svg">
                        <img src="${ctx}/asset/1.svg" id="show-img" style="object-fit: cover">
                    </div>
                    <div class="small-img">
                        <img src="${ctx}/asset/online_icon_right@2x.png" class="icon-left" alt="" id="prev-img">
                        <div class="small-container">
                            <div id="small-img-roll">
                                <img src="${ctx}/asset/1.svg" class="show-small-img" alt="">
                                <img src="${ctx}/asset/22.svg" class="show-small-img" alt="">
                                <img src="${ctx}/asset/333.svg" class="show-small-img" alt="">
                                <img src="${ctx}/asset/39b91372-ce23-4be1-9188-37d5418bafdf.png" class="show-small-img" alt="">
                                <img src="${ctx}/asset/220572b5-d462-4ed2-8a48-c77695faf10a.png" class="show-small-img" alt="">
                            </div>
                        </div>
                        <img src="${ctx}/asset/online_icon_right@2x.png" class="icon-right" alt="" id="next-img">
                    </div>
                </div>
            </div>
            <#-- 价格简介区 -->
            <div class="col-5">
                <div class="m-5">
                    江西农业大学-5毛甩卖
                </div>
            </div>
        </div>
        <hr/>
        <#-- 详细信息区 -->
        <div class="row">
            <div class="text-center">
                <p>
                    sdfghjkl;'
                </p>
            </div>
        </div>
    </div>
</main>
<footer class="footer mt-auto py-3">
    <hr/>
    <div class="container text-center">
        Copyright © 2008-2019 The JXAU.EDU.CN
    </div>
</footer>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/js/cjn.js"></script>
</html>