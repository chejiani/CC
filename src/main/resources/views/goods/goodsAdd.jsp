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
<meta http-equiv="Content-Type" content="text/html; charset=utf">
<title>add goods</title>
<script src="../../static/laydate/laydate.js" language="javascript" type="text/javascript"></script>
</head>
<body>
<img src="<s:property value="upload+ '/1_160x160.jpg'"/>">
<img src="<%=request.getContextPath()%>/upload/1_160x160.jpg"/>
<%-- <form action="<%=path%>/goods/Goods_add.action" method="post" enctype="multipart/form-data">
	<table cellspacing=1 cellpadding=3 width="95%" align=center bgcolor=#6ab6b6 border=0>
  <tbody>
  <tr>
    <th colspan=2 height=24>【新增商品】</th> 
   </tr>
    <tr>
    <td class=forumrow width="30%" height=24><div align="right">商品编号：</div></td>
  	<td class=forumrowhighlight width="70%" height=24><input type="text" name="goods_id"></td>
    </tr>
  <tr>
    <td class=forumrow width="30%" height=24><div align="right">商品名称：</div></td>
  	<td class=forumrowhighlight width="70%" height=24><input type="text" name="goods_name"></td>
    </tr>
  <tr>
    <td class=forumrow height=24><div align="right">商品分类：</div></td>
    <td class=forumrowhighlight height=24>
      <select name="goods_class">
      	<option value="无">请选择商品类别</option>
      	<option value="办公用品">办公用品</option>
      	<option value="数码用品">数码用品</option>
      	<option value="寝室神器">寝室神器</option>
<!--       	<s:iterator value="goodsClass" var="goodsClass">
      		<option value="${goodsClass.goodsClassId}">
      			${goodsClass.goodsClassName}
      		</option>
      	</s:iterator>
      </select>
 -->
      </td>
  </tr>
  <tr>
    <td class=forumrow height=24><div align="right">商品图片：</div></td>
    <td class=forumrowhighlight height=24>
    	<input type="file" name="upload">
    </td>
  </tr>
  <tr>
    <td class=forumrow height=24><div align="right">商品描述：</div></td>
    <TD class=forumrowhighlight height=24>
      <textarea name="goods_desc" cols="50" rows="5"></textarea></td>
  </tr>
  <tr>
    <td class=forumrow height=24><div align="right">商品起拍价格：</div></td>
    <td class=forumrowhighlight height=24>
      <input type="text" name="init_price"></td>
  </tr>
  <tr>
    <td class=forumrow height=24><div align="right">商品一口价：</div></td>
    <td class=forumrowhighlight height=24>
    	<input type="text" name="order_price">
    </td>
  </tr>
  <tr>
	    <td class=forumrow height=24><div align="right">商品每次最少加价：</div></td>
	    <td class=forumrowhighlight height=24>
			<input type="text" name="each_incr">
	    </td>
  </tr>
	<tr>
		<td class=forumrow height=24><div align="right">商品起拍时间：</div></td>
		<td class=forumrowhighlight height=24>
			<input id="add_time" name="add_time" class="laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',elem: '#add_time'})"/>
		</td>
		
	</tr>
	<tr>
		<td class=forumrow height=24><div align="right">商品结束拍卖时间：</div></td>
		<td><input id="end_time" name="end_time" class="laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',elem: '#end_time'})"/></td>
	</tr>
	 <tr>
    <td class=forumrow height=24><div align="right">商品拍卖区域：</div></td>
    <td class=forumrowhighlight height=24>
	    <select name="bid_area">
	      	<option value="无">请选择商品拍卖区域</option>
	      	<option value="长春大学南湖校区">长春大学南湖校区</option>
	      	<option value="长春大学林园校区">长春大学林园校区</option>
	      	<option value="长春大学北湖校区">长春大学北湖校区</option>
		</select>
	</td>
  </tr>
  <tr>
    <td class=forumrow height=24>&nbsp;</td>
    <td class=forumrowhighlight 
      height=24><input type="submit" value="提交">
      <input type="reset" value="重置"></td>
  </tr>
  </tbody></table>
</form> --%>
</body>
</html>