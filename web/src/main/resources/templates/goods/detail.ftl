<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>易拍</title>
    <link href="${ctx}css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}css/style.css" rel="stylesheet" type="text/css"/>
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
    <div class="container-fluid pl-xl-5">
        <div class="row">
            <div class="col-md-6">
                <div class="container">
                    <div class="row text-center">
                        <div class="gallery">
                            <div class="preview">
                                <a href="${big!''}"  id="zoom" rel="zoom-width:400px;zoom-height:400px;"  class="MagicZoom">
                                    <img   src="${big!''}" />
                                </a>
                            </div>
                            <div class="control_bar">
                                <div class="control left-control"></div>
                                <div class="thumblist">
                                    <ul>
                                        <li class="last selected">
                                            <img src="">
                                        </li>
                                    </ul>
                                </div>
                                <div class="control right-control "></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        
                    </div>
                </div>
            </div>
            <div class="col-md-6">

            </div>
        </div>
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
<script src="${ctx}js/jquery-3.1.1.min.js"></script>
<script src="${ctx}js/bootstrap.min.js"></script>
<script src="${ctx}js/bootstrap.bundle.min.js"></script>
<script src="${ctx}js/cjn.js"></script>
</html>