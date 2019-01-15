<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上传图片</title>
</head>
<body>
	<form action="Bid_upload.action" method="post" enctype="multipart/form-data" >
	<table>
	<tr>
	<td>上传<input type="file" name="myfile" value="" /></td>
	<td><input type="submit"/></td>
	</tr>
	</table>
	</form>

</body>
</html>