<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="userBean" class="javabean.Register" scope="request"></jsp:useBean>
<html>

<head>
<meta charset="UTF-8">
<title>注册</title>
<link href="css/a.css" rel="stylesheet"> 
</head>
<body class="bg">
<div align="center">
		<h1 id="h">注册</h1>
	<div>
		<form action="register" name="form" method="post">
			<div class="input">
				<label><span>*用户名</span></label>
				<input type="text" name="mnum" placeholder="account" class="form_input" >
			</div>
			<div class="input">
				<label><span>*密&nbsp;&nbsp;&nbsp;码</span></label>
				<input type="password" name="mpassword" placeholder="password" class="form_input">	
			</div>
			<div>
			<input type="submit" class="submita" value="提交" onclick="window.open('longin.jsp')">
			
			</div>
		</form>
	</div>

</div>

</body>
</html>