<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <title>首页</title>

    <link href="../../static/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="../../static/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="../../static/css/demo.css" rel="stylesheet" type="text/css"/>

    <link href="../../static/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="../../static/css/skin.css" rel="stylesheet" type="text/css"/>
    <script src="../../static/js/jquery.min.js"></script>
    <script src="../../static/js/amazeui.min.js"></script>
</head>
<body>

<div class="hmtop">
    <!--顶部导航条 -->
    <div class="am-container header">
        <s:iterator var="user" value="#session.user_list" status="status"></s:iterator>
        <ul class="message-r">
            <div class="topMessage"></div>
            <div class="topMessage home">
                <div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
            </div>
            <div class="topMessage my-shangcheng">
                <!-- 登陆用户信息 -->
                <div><a href="User_modify.action?userid=<s:property value="#session.user.user_id"/>"><s:property
                        value="#session.user.nick_name"/></a></div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="<%=path%>/goods/Goods_query.action" target="_top"><i
                        class="am-icon-shopping-cart  am-icon-fw"></i><span>商品信息</span></a></div>
            </div>
            <div class="topMessage favorite">
                <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
                </div>
        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo"><img src="../../static/images/logo.png"/></div>
        <div class="logoBig">
            <li><img src="../../static/images/logobig.png"/></li>
        </div>

        <div class="search-bar pr">
            <form action="<%=path%>/goods/Goods_search.action" method="post">
                <input id="goodsname" name="goodsname" type="text" placeholder="搜索" autocomplete="off">
                <a><input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit"></a>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>

<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1"><a href="introduction.html"><img src="../../static/images/ad1.jpg"/></a></li>
            <li class="banner2"><a><img src="../../static/images/ad2.jpg"/></a></li>
            <li class="banner3"><a><img src="../../static/images/ad3.jpg"/></a></li>
            <li class="banner4"><a><img src="../../static/images/ad4.jpg"/></a></li>

        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="shopNav">
    <div class="slideall">

        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="#">首页</a></li>
                <li class="qc"><a href="#">闪购</a></li>
                <li class="qc"><a href="#">限时抢</a></li>
                <li class="qc"><a href="#">团购</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
        </div>

        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">

                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <li class="appliance js_toggle relative first">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/cake.png"></i><a
                                            class="ml-22" title="寝室神器">寝室神器</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="寝室神器">寝室神器</span></dt>
                                                        <dd><a title="吊椅" href="#"><span>吊椅</span></a></dd>
                                                        <dd><a title="支架" href="#"><span>支架</span></a></dd>
                                                        <dd><a title="储物柜" href="#"><span>储物柜</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/cookies.png"></i><a
                                            class="ml-22" title="数码电器">数码电器</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="数码电器">数码电器</span></dt>
                                                        <dd><a title="风扇" href="#"><span>风扇</span></a></dd>
                                                        <dd><a title="手机" href="#"><span>手机</span></a></dd>
                                                        <dd><a title="数码配件" href="#"><span>数码配件</span></a></dd>
                                                        <dd><a title="电脑" href="#"><span>电脑</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/meat.png"></i><a
                                            class="ml-22" title="校园代步">校园代步</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="校园代步">校园代步</span></dt>
                                                        <dd><a title="电动车" href="#"><span>电动车</span></a></dd>
                                                        <dd><a title="自行车" href="#"><span>自行车</span></a></dd>
                                                        <dd><a title="风火轮" href="#"><span>风火轮</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a rel="nofollow" title="花颜巧语 " target="_blank" href="#"
                                                               rel="nofollow"><span class="red">花颜巧语 </span></a></dd>
                                                        <dd><a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
                                                               rel="nofollow"><span>糖衣小屋</span></a></dd>
                                                        <dd><a rel="nofollow" title="卡拉迪克  " target="_blank" href="#"
                                                               rel="nofollow"><span class="red">卡拉迪克  </span></a></dd>
                                                        <dd><a rel="nofollow" title="暖春童话 " target="_blank" href="#"
                                                               rel="nofollow"><span>暖春童话 </span></a></dd>
                                                        <dd><a rel="nofollow" title="华盛童装批发行 " target="_blank" href="#"
                                                               rel="nofollow"><span>华盛童装批发行 </span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/bamboo.png"></i><a
                                            class="ml-22" title="日用百货">日用百货</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="日用百货">日用百货</span></dt>
                                                        <dd><a title="脸盆" href="#"><span>脸盆</span></a></dd>
                                                        <dd><a title="衣架" href="#"><span>衣架</span></a></dd>
                                                        <dd><a title="撑衣杆" href="#"><span>撑衣杆</span></a></dd>
                                                        <dd><a title="自拍杆" href="#"><span>自拍杆</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a rel="nofollow" title="歌芙品牌旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">歌芙品牌旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="爱丝蓝内衣厂" target="_blank" href="#"
                                                               rel="nofollow"><span>爱丝蓝内衣厂</span></a></dd>
                                                        <dd><a rel="nofollow" title="香港优蓓尔防辐射" target="_blank" href="#"
                                                               rel="nofollow"><span>香港优蓓尔防辐射</span></a></dd>
                                                        <dd><a rel="nofollow" title="蓉莉娜内衣批发" target="_blank" href="#"
                                                               rel="nofollow"><span>蓉莉娜内衣批发</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/nut.png"></i><a
                                            class="ml-22" title="运动健身">运动健身</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="运动健身">运动健身</span></dt>
                                                        <dd><a title="单车" href="#"><span>单车</span></a></dd>
                                                        <dd><a title="篮球" href="#"><span>篮球</span></a></dd>
                                                        <dd><a title="滑板" href="#"><span>滑板</span></a></dd>
                                                        <dd><a title="轮滑" href="#"><span>轮滑</span></a></dd>
                                                    </dl>

                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a rel="nofollow" title="呵呵嘿官方旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">呵呵嘿官方旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span>格瑞旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">飞彦大厂直供</span></a></dd>
                                                        <dd><a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#"
                                                               rel="nofollow"><span>红e·艾菲妮</span></a></dd>
                                                        <dd><a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">本真旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="杭派女装批发网" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">杭派女装批发网</span></a></dd>
                                                        <dd><a rel="nofollow" title="华伊阁旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span>华伊阁旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="独家折扣旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span>独家折扣旗舰店</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/candy.png"></i><a
                                            class="ml-22" title="鞋服配饰">鞋服配饰</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="鞋服配饰">鞋服配饰</span></dt>
                                                        <dd><a title="帽子" href="#"><span>帽子</span></a></dd>
                                                        <dd><a title="围巾" href="#"><span>围巾</span></a></dd>
                                                        <dd><a title="项链" href="#"><span>项链</span></a></dd>
                                                        <dd><a title="手链" href="#"><span>手链</span></a></dd>
                                                        <dd><a title="腰带" href="#"><span>腰带</span></a></dd>
                                                        <dd><a title="上衣" href="#"><span>上衣</span></a></dd>
                                                        <dd><a title="裤子" href="#"><span>裤子</span></a></dd>
                                                        <dd><a title="背包" href="#"><span>背包</span></a></dd>
                                                        <dd><a title="太阳镜" href="#"><span>太阳镜</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a rel="nofollow" title="YYKCLOT" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">YYKCLOT</span></a></dd>
                                                        <dd><a rel="nofollow" title="池氏品牌男装" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">池氏品牌男装</span></a></dd>
                                                        <dd><a rel="nofollow" title="男装日志" target="_blank" href="#"
                                                               rel="nofollow"><span>男装日志</span></a></dd>
                                                        <dd><a rel="nofollow" title="索比诺官方旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span>索比诺官方旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="onTTno傲徒" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">onTTno傲徒</span></a></dd>
                                                        <dd><a rel="nofollow" title="卡斯郎世家批发城" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">卡斯郎世家批发城</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/chocolate.png"></i><a
                                            class="ml-22" title="书籍资料">书籍资料</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="书籍资料">书籍资料</span></dt>
                                                        <dd><a title="教科书" href="#"><span>教科书</span></a></dd>
                                                        <dd><a title="文学" href="#"><span>文学</span></a></dd>
                                                        <dd><a title="养生" href="#"><span>养生</span></a></dd>
                                                        <dd><a title="时尚" href="#"><span>时尚</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a rel="nofollow" title="花颜巧语 " target="_blank" href="#"
                                                               rel="nofollow"><span class="red">花颜巧语 </span></a></dd>
                                                        <dd><a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
                                                               rel="nofollow"><span>糖衣小屋</span></a></dd>
                                                        <dd><a rel="nofollow" title="卡拉迪克  " target="_blank" href="#"
                                                               rel="nofollow"><span class="red">卡拉迪克  </span></a></dd>
                                                        <dd><a rel="nofollow" title="暖春童话 " target="_blank" href="#"
                                                               rel="nofollow"><span>暖春童话 </span></a></dd>
                                                        <dd><a rel="nofollow" title="华盛童装批发行 " target="_blank" href="#"
                                                               rel="nofollow"><span>华盛童装批发行 </span></a></dd>
                                                        <dd><a rel="nofollow" title="奈仕华童装旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span>奈仕华童装旗舰店</span></a></dd>

                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/fish.png"></i><a
                                            class="ml-22" title="办公用品">办公用品</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="办公用品">办公用品</span></dt>
                                                        <dd><a title="签字笔" href="#"><span>签字笔</span></a></dd>
                                                        <dd><a title="A4纸" href="#"><span>A4纸</span></a></dd>
                                                        <dd><a title="学校信纸" href="#"><span>学校信纸</span></a></dd>
                                                        <dd><a title="软面包" href="#"><span>钢笔</span></a></dd>
                                                        <dd><a title="马卡龙" href="#"><span>毛笔</span></a></dd>
                                                        <dd><a title="千层饼" href="#"><span>本子</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a rel="nofollow" title="歌芙品牌旗舰店" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">歌芙品牌旗舰店</span></a></dd>
                                                        <dd><a rel="nofollow" title="爱丝蓝内衣厂" target="_blank" href="#"
                                                               rel="nofollow"><span>爱丝蓝内衣厂</span></a></dd>
                                                        <dd><a rel="nofollow" title="炫点服饰" target="_blank" href="#"
                                                               rel="nofollow"><span>炫点服饰</span></a></dd>
                                                        <dd><a rel="nofollow" title="雪茵美内衣厂批发" target="_blank" href="#"
                                                               rel="nofollow"><span>雪茵美内衣厂批发</span></a></dd>
                                                        <dd><a rel="nofollow" title="金钻夫人" target="_blank" href="#"
                                                               rel="nofollow"><span>金钻夫人</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/tea.png"></i><a
                                            class="ml-22" title="电脑外设">电脑外设</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="电脑外设">电脑外设</span></dt>
                                                        <dd><a title="蒸蛋糕" href="#"><span>键盘</span></a></dd>
                                                        <dd><a title="脱水蛋糕" href="#"><span>鼠标</span></a></dd>
                                                        <dd><a title="瑞士卷" href="#"><span>音响</span></a></dd>
                                                        <dd><a title="软面包" href="#"><span>耳机</span></a></dd>
                                                        <dd><a title="马卡龙" href="#"><span>鼠标垫</span></a></dd>
                                                        <dd><a title="千层饼" href="#"><span>内存条</span></a></dd>
                                                        <dd><a title="甜甜圈" href="#"><span>硬盘</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a title="今生只围你" target="_blank" href="#"
                                                               rel="nofollow"><span>今生只围你</span></a></dd>
                                                        <dd><a title="忆佳人" target="_blank" href="#" rel="nofollow"><span
                                                                class="red">忆佳人</span></a></dd>
                                                        <dd><a title="斐洱普斯" target="_blank" href="#"
                                                               rel="nofollow"><span class="red">斐洱普斯</span></a></dd>
                                                        <dd><a title="聚百坊" target="_blank" href="#" rel="nofollow"><span
                                                                class="red">聚百坊</span></a></dd>
                                                        <dd><a title="朵朵棉织直营店" target="_blank" href="#"
                                                               rel="nofollow"><span>朵朵棉织直营店</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                            </li>
                            <li class="appliance js_toggle relative last">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="../../static/images/package.png"></i><a
                                            class="ml-22" title="品牌、礼包">其他用品</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="其他用品">其他用品</span></dt>
                                                        <dd><a title="蒸蛋糕" href="#"><span>票类</span></a></dd>
                                                        <dd><a title="脱水蛋糕" href="#"><span>成人</span></a></dd>
                                                        <dd><a title="瑞士卷" href="#"><span>虚拟</span></a></dd>
                                                        <dd><a title="软面包" href="#"><span>其他</span></a></dd>
                                                    </dl>
                                                </div>
                                                <div class="brand-side">
                                                    <dl class="dl-sort">
                                                        <dt><span>实力商家</span></dt>
                                                        <dd><a title="琳琅鞋业" target="_blank" href="#"
                                                               rel="nofollow"><span>琳琅鞋业</span></a></dd>
                                                        <dd><a title="宏利鞋业" target="_blank" href="#"
                                                               rel="nofollow"><span>宏利鞋业</span></a></dd>
                                                        <dd><a title="比爱靓点鞋业" target="_blank" href="#"
                                                               rel="nofollow"><span>比爱靓点鞋业</span></a></dd>
                                                        <dd><a title="浪人怪怪" target="_blank" href="#"
                                                               rel="nofollow"><span>浪人怪怪</span></a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>


        <!--轮播-->

        <script type="text/javascript">
            (function () {
                $('.am-slider').flexslider();
            });
            $(document).ready(function () {
                $("li").hover(function () {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function () {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>


        <!--小导航 -->
        <div class="am-g am-g-fixed smallnav">
            <div class="am-u-sm-3">
                <a href="sort.html"><img src="../../static/images/navsmall.jpg"/>
                    <div class="title">商品分类</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="../../static/images/huismall.jpg"/>
                    <div class="title">大聚惠</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="../../static/images/mansmall.jpg"/>
                    <div class="title">个人中心</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="../../static/images/moneysmall.jpg"/>
                    <div class="title">投资理财</div>
                </a>
            </div>
        </div>

        <!--走马灯 -->

        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function () {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }

            $(function () {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">

        <!--今日推荐 -->

        <div class="am-g am-g-fixed recommendation">
            <div class="clock am-u-sm-3"
            ">
            <img src="../../static/images/2016.png "></img>
            <p>今日<br>推荐</p>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>真的有鱼</h3>
                <h4>开年福利篇</h4>
            </div>
            <div class="recommendationMain one">
                <a href="introduction.html"><img src="../../static/images/tj.png "></img></a>
            </div>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>囤货过冬</h3>
                <h4>让爱早回家</h4>
            </div>
            <div class="recommendationMain two">
                <img src="../../static/images/tj1.png "></img>
            </div>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>浪漫情人节</h3>
                <h4>甜甜蜜蜜</h4>
            </div>
            <div class="recommendationMain three">
                <img src="../../static/images/tj2.png "></img>
            </div>
        </div>

    </div>
    <script>
        window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
    </script>
    <script type="text/javascript " src="../basic/js/quick_links.js "></script>

</body>
</html>