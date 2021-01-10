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

<p><a href="upersonalServlet">个人中心</a></p>
<p><a href="uordermangementservlet">订单查看</a></p>
<p><a href="udemandmangementservlet">求购查看</a></p>
<p><a href="U-demand-upload.jsp">发布求购</a></p>
<p><a href="logoutservlet">登出</a></p>
</body>
</html>