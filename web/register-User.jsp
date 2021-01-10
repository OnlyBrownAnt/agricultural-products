<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="javabean.Register" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<style>
*{
	margin:0px;padding:0px;/*默认是指网页上所有的元素的margin和padding值为0*/
}
body{
	background-image: url('img/farm.jpg');
	overflow:auto;/*如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。*//*这个属性最好只个body或者相对小级子元素，像home里一样，若是auto，下拉框在超出div时可能无法实现*/
}
.main{
	overflow:visible;/*	默认值。内容不会被修剪，会呈现在元素框之外。*/
/*	width:1549.71px;/*如果这里还是应用的body默认的网页打开的实时宽度，相当于width不定，会因为父元素的width不定，使在页面变小时，后续子元素变形*/
	/*min-width:1500px;*/
	width:100%;
}
/*longin*/
.register{
	margin-top:100px;
	margin-left:68%;
	width:300px;
	height:380px;
	background-color:#FFCC99;
	border-radius:20px;/*向元素添加圆角边框*/
}
/*longin-choose*/
.register-choose{	
	height:40px;
	width:100%;
	/*border:1px solid red;*/
}
.register-choose-table{
	height:100%;
	width:80%;
	/*margin-top:20px;*/
	margin-left:30px;
}
.register-choose-table tr{/*对tr修饰好像没有用*/	
}
.register-choose-table tr td{
	/*background-color:#00FFFF;*/
	/*border-style:groove;*/
	width:33.3%;
	text-align:center;/*字体居中*/
	background-color:#FF9966;
	
}
.register-choose-table tr td a{
	height:100%;
	text-decoration:none;/*去掉链接的文本下划线*/
	color:#505050;/*深灰*/
	/*text-align:center/*字体居中*//*在这里没什么用，要设置td的属性才行*/
}
.register-choose-table tr td:hover{
	background-color:#00FFFF;/*鼠标移到td上时背景变色*/
}
.register-choose-table tr td a:hover{
	color:red;/*鼠标移到链接上时字体变色*/
}
/*longin-form*/
.register-form{
	width:100%;

}
.register-form-table{
	width:80%;
	margin-top:10px;
	margin-left:30px;
}
.register-form-table tr{/*对tr修饰好像没有用*/

	
}
.register-form-table tr td{
	height:40px;/*变相控制输入框间距*/
	text-align:center;/*字体居中*/
}
.logname{
	height:25px;
	border:none;/*去掉边框*/
	width:100%;
	border-radius:3px;/*向元素添加圆角边框*/
	background-color:#F0F0F0;/*灰白色，导航栏背景色*/
}
.password{
	height:25px;
	border:none;
	width:100%;
	border-radius:3px;/*向元素添加圆角边框*/
	background-color:#F0F0F0;/*灰白色，导航栏背景色*/
}
.option{
	margin-top:15px;
	margin-left:50%;
	height:30px;
	width:40%;
	text-align:center;/*字体居中*/
	border-radius:3px;/*向元素添加圆角边框*/
	background-color:#F0F0F0;/*灰白色，导航栏背景色*/
}
.submit{
	margin-top:15px;
	margin-left:25%;
	height:30px;
	width:50%;
	background-color:#00BFFF;
	border-radius:6px;/*向元素添加圆角边框*/
}
</style>
<meta charset="UTF-8">
<title>注册</title>
</head>
<body>
<div class="main">
	<div class="Nva">
		<jsp:include page="Nva.jsp"/>
	</div>
	<div class="register">
		<div class="register-choose">
			<table class="register-choose-table">
				<tr>
					<td><a href="#">用户</a></td>
					<td><a href="register-Merchant.jsp">商家</a></td>
				</tr>
			</table>
		</div>
		<div class="register-form">
			<form action="registeruser" method="post">
				<!--<select name=option class="option">
					<option value="User">用户</option>
					<option value="Merchant">商户</option>
					<option value="Administrator">管理员</option>
				</select>  -->
			<table class="register-form-table">
				<tr><td>账号:</td> <td><input type=text name="mnum" class="logname" value=""></td></tr>
				<tr><td>密码:</td> <td><input type=password name="mpassword" class="password" value=""></td></tr>
			</table>
				<input type=submit name="submit" value="提交" class="submit">
			</form>
		</div>
	</div>

</div>
</body>
</html>