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
<p><a href="newsservlet">热点新闻</a></p>
<p><a href="recentproductservlet">最新产品上架</a></p>
<p><a href="demandmangementservlet">最新求购信息</a></p>
</body>
</html>