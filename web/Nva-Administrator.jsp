<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
p{
	margin-left:20px;
	margin-top:30px;
	margin-bottom:30px;
	height:15px;
}
p a{
	text-decoration:none;/*去掉链接的文本下划线*/
	color:#505050;/*深灰*/
	text-align:center;
	height:100px;
	width:100px;
}
p a:hover{
	color:red;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<p><a href="apersonalServlet">信息修改</a></p>
<p><a href="productservlet">产品管理</a></p>
<p><a href="merchantmangementservlet">商户管理</a></p>
<p><a href="logoutservlet">登出</a></p>
</body>
</html>