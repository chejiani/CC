<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0"> 
		
		<title>商品页面</title>

		<link href="../../static/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="../../static/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../../static/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../../static/css/optstyle.css" rel="stylesheet" type="text/css"/>
		<link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="../../static/css/hmstyle.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="../../static/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../../static/js/quick_links.js"></script>
		<script type="text/javascript" src="../../static/js/amazeui.js"></script>
		<script type="text/javascript" src="../../static/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="../../static/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="../../static/js/list.js"></script>
		<script type="text/javascript" src="../../static/layer/layer.js"></script>

	</head>

	<body>
	<!--顶部导航条 -->
	<s:property value="#session.bidid"/>
		<div class="am-container header">
			<ul class="message-r">
				<div class="topMessage"></div>
				<div class="topMessage home">
					<div class="menu-hd"><a href="<%=path%>/views_success.jsp" target="_top" class="h">商城首页</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<!-- 登陆用户信息 -->
					<div>
						<a href="<%=path%>/user/User_modify.action?userid=<s:property value="#session.user.user_id"/>"><s:property value="#session.user.nick_name"/></a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="<%=path%>/goods/Goods_query.action" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>商品信息</span></a></div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="<%=path%>/bid/Bid_search.action?username=<s:property value="#session.user.nick_name"/>" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a></div>
				</div>
			</ul>
		</div>
		<!--悬浮搜索框-->
		<div class="nav white">
			<div class="logo"><img src="../../static/images/logo.png" /></div>
			<div class="logoBig">
				<li><img src="../../static/images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<form action="<%=path%>/goods/Goods_search.action" method="post">
					<input id="goodsname" name="goodsname" type="text" placeholder="搜索" autocomplete="off">
					<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
				</form>
			</div>
		</div>

			<div class="clear"></div>
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="qc"><a href="<%=path%>/goods/Goods_search.action">今日拍卖</a></li>
                             	<li class="qc"><a href="#">我的拍卖</a></li>
	                             <li class="qc"><a href="#">我的竞拍</a></li>
	                             <li class="qc"><a href="<%=path%>/views>用户登录</a></li>
	                             <li class="qc last"><a href="<%=path%>/viewssp">用户注册</a></li>
							</ul>
						</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
				</ol>
				
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="<%=request.getContextPath()%>/<s:property value="#session.goods.goods_picture"/>" title="pic" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">
						<div class="box">
							<div class="tb-booth tb-pic tb-s310">
								<a href="img src="<%=request.getContextPath()%>/<s:property value="#session.goods.goods_picture"/>"">
								<img src="<%=request.getContextPath()%>/<s:property value="#session.goods.goods_picture"/>" alt="细节展示放大镜特效" 
									rel="<%=request.getContextPath()%>/<s:property value="#session.goods.goods_picture"/>" class="jqzoom" /></a>
							</div>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">
						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
								<s:property value="#session.goods.goods_name"/>
								<s:property value="#session.goods.goods_class"/>
								<s:property value="#session.goods.goods_desc"/>
					        </h1>
						</div>
						<div class="tb-detail-list">
							
							<div class="clear"></div>
							<!--地址	-->
							<div class="shopPromotion gold">
								<div class="hot">
									<dt class="tb-metatit">接单区域</dt>
									<div class="gold-list">
										<p><s:property value="#session.goods.bid_area"/></p>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						
							<!--价格-->
							<div class="tb-detail-price">
								<li class="tb-metatit">
									起拍价
									¥<s:property value="#session.goods.init_price"/>                              
								</li>
								<li class="price iteminfo_mktprice">
									一口价
									<s:property value="#session.goods.max_price"/>								
								</li>
								<li class="price iteminfo_price">
									起拍时间
									<s:date name="#session.goods.add_time" format="yyyy-MM-dd HH:mm:ss"/>                              
								</li>
								<li class="price iteminfo_mktprice">
									截止时间
									<s:date name="#session.goods.end_time" format="yyyy-MM-dd HH:mm:ss"/>								
								</li>
								<li class="price iteminfo_mktprice">
									每次最少加价：
									<s:property value="#session.goods.each_incr"/>元
								</li>
								<li class="price iteminfo_mktprice">
									卖家姓名：
									<s:property value="#session.goods.owner_name"/>
								</li>
								<li class="price iteminfo_mktprice">
									商品当前状态：
									<s:property value="#session.goods.goods_state"/>
								</li>
						</div>
						<!--倒计时 -->
						<div id="CountMsg" class="daojishi">
							距离拍卖结束还有：
							  <span id="t_d">0天</span>
							  <span id="t_h">0时</span>
							  <span id="t_m">0分</span>
							  <span id="t_s">0秒</span>
						</div>
						<input id="end_time" type="hidden" value="<s:date name="#session.goods.end_time" format="yyyy-MM-dd HH:mm:ss" />"/>
						<div class="clear"></div>
						
						<div class="pay">
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="Bid_price" title="点此按钮到下一步确认购买信息" href="javascript:onclick=bidPrice()">出价拍卖</a>
								</div>
							</li>

							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="Fixed_price" title="一口价成交" href="<%=path%>/bid/Bid_add.jsp" >一口价成交</a>
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				<div class="clear"></div>
	
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>
						     	
							      <li class="first">
							      	<div class="p-img">                    
							      		<a href="#"> <img class="" src="../../static/images/browse1.jpg"> </a>
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li>
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
											<li title="">产品类型:&nbsp;烘炒类</li>
											<li title="">原料产地:&nbsp;巴基斯坦</li>
											<li title="">产地:&nbsp;湖北省武汉市</li>
											<li title="">配料表:&nbsp;进口松子、食用盐</li>
											<li title="">产品规格:&nbsp;210g</li>
											<li title="">保质期:&nbsp;180天</li>
											<li title="">产品标准号:&nbsp;GB/T 22165</li>
											<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
											<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存 </li>
											<li title="">食用方法：&nbsp;开袋去壳即食</li>
										</ul>
										<div class="clear"></div>
									</div>

									<div class="clear"></div>

								</div>

								<div class="am-tab-panel am-fade">
									
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>100<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                            			<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                            			<q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                            			<q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                            			<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                            			<q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                            			<q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                            			<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                            			<q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                            			<q class="comm-tags"><span>皮很薄</span><em>(831)</em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<ul class="am-comments-list am-comments-list-flip">
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="../../static/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>			

									</ul>

									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>

									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>

								</div>

								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="../../static/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>

								</div>

							</div>

						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
	<script type="text/javascript">
	    function getRTime(){
			var date = $("#end_time").val();
		    var EndTime= new Date(date); //截止时间 
		   // alert(date);
		    var NowTime = new Date();
		    var t =EndTime.getTime() - NowTime.getTime();
		    var d;var h;
		    var m;var s;
	        if(t < 0){
	        	d=0;h=0;
	        	m=0;s=0;
	        }
	        else{
		        d=Math.floor(t/1000/60/60/24);
		        h=Math.floor(t/1000/60/60%24);
		        m=Math.floor(t/1000/60%60);
		        s=Math.floor(t/1000%60);
	        }
	        document.getElementById("t_d").innerHTML = d + "天";
	        document.getElementById("t_h").innerHTML = h + "时";
	        document.getElementById("t_m").innerHTML = m + "分";
	        document.getElementById("t_s").innerHTML = s + "秒";
	    }
	   setInterval(getRTime,1000);

    </script>
			
	<script type="text/javascript">
		var flag = false;
		var money = 0;
		function bidPrice(){
			layer.open({
				  type: 2,
				  title: '竞拍出价',
				  shadeClose: true,
				  shade: 0.8,
				  area: ['380px', '90%'],
				  content: ['../bid/Bidding.jsp'], //iframe的url
			}); 
		}
		function jump(res){
			money = res;
			if(money != 0){
				location.href="<%=path%>/bid/Bid_temp_add.jsp?price="+money;
			}
		}
	</script>
	
	<script type="text/javascript">
		$(function() {});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation: "slide",
				start: function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".jqzoom").imagezoom();
			$("#thumblist li a").click(function() {
				$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
				$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
				$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
			});
		});
	</script>
</body>
</html>