<!DOCTYPE html>
<#assign ctx=request.contextPath/>
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
    <div id="carousel" class="carousel slide mb-5" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class=""></li>
            <li data-target="#carousel" data-slide-to="1" class="active"></li>
            <li data-target="#carousel" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="${ctx}asset/8289e008-3538-4fe7-b98e-5a9517dd662c.png" width="100%" height="400">
                <div class="carousel-caption d-none d-md-block">
                    <h5>江西农业大学校园竞拍系统正式上线</h5>
                    <p>江西农业大学校园竞拍系统正式上线使用，欢迎广大师生使用，增加资源利用率，让自己的闲置物品找回价值</p>
                </div>
            </div>
            <div class="carousel-item active">
                <img src="${ctx}asset/39b91372-ce23-4be1-9188-37d5418bafdf.png" width="100%" height="400">
                <div class="carousel-caption d-none d-md-block">
                    <h5>校园竞拍系统-易拍上线啦</h5>
                    <p>全国首套校园竞拍系统在江西农业大学正式上线使用</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${ctx}asset/220572b5-d462-4ed2-8a48-c77695faf10a.png" width="100%" height="400">
                <div class="carousel-caption d-none d-md-block">
                    <h5>江西农业大学开通在线竞拍系统</h5>
                    <p>江西农业大学开通在线竞拍系统，有望提高全校师生的闲置资源利用率，并作为示范院校优先开通系统运营</p>
                </div>
            </div>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/1.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">计算机组成原理</h5>
                        <p class="card-text text-muted">高等教育出版社-计算机科学与技术专业交材-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">12</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/22.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">毛泽东思想</h5>
                        <p class="card-text text-muted">高等教育出版社-毛泽东思想-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">20</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">50</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/333.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">会计从业资格考试资料</h5>
                        <p class="card-text text-muted">高等教育出版社-会计从业资格考试资料-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">10</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/1.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">计算机组成原理</h5>
                        <p class="card-text text-muted">高等教育出版社-计算机科学与技术专业交材-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">12</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/22.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">毛泽东思想</h5>
                        <p class="card-text text-muted">高等教育出版社-毛泽东思想-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">20</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">50</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/333.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">会计从业资格考试资料</h5>
                        <p class="card-text text-muted">高等教育出版社-会计从业资格考试资料-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">10</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/1.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">计算机组成原理</h5>
                        <p class="card-text text-muted">高等教育出版社-计算机科学与技术专业交材-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">12</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/22.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">毛泽东思想</h5>
                        <p class="card-text text-muted">高等教育出版社-毛泽东思想-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">20</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">50</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/333.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">会计从业资格考试资料</h5>
                        <p class="card-text text-muted">高等教育出版社-会计从业资格考试资料-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">10</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/1.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">计算机组成原理</h5>
                        <p class="card-text text-muted">高等教育出版社-计算机科学与技术专业交材-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">12</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/22.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">毛泽东思想</h5>
                        <p class="card-text text-muted">高等教育出版社-毛泽东思想-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">20</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">50</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/333.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">会计从业资格考试资料</h5>
                        <p class="card-text text-muted">高等教育出版社-会计从业资格考试资料-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">10</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/1.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">计算机组成原理</h5>
                        <p class="card-text text-muted">高等教育出版社-计算机科学与技术专业交材-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">12</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/22.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">毛泽东思想</h5>
                        <p class="card-text text-muted">高等教育出版社-毛泽东思想-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">20</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">50</span>
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
            <div class="col-md-3 card-deck">
                <div class="card mb-4 shadow-sm">
                    <img src="${ctx}/asset/333.svg" width="100%" height="225">
                    <div class="card-body">
                        <h5 class="card-title">会计从业资格考试资料</h5>
                        <p class="card-text text-muted">高等教育出版社-会计从业资格考试资料-9成新</p>
                        <div>
                            <hr/>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">当前竞拍价￥：</h6>
                                    </div>
                                    <span class="text-muted">10</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">一口价￥：</h6>
                                    </div>
                                    <span class="text-success">20</span>
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