<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sun.rowset.CachedRowSetImpl"%>   
    <jsp:useBean id="dataBeanlongin" class="javabean.longinJavabean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<style>
*{
	margin:0px;padding:0px;/*默认是指网页上所有的元素的margin和padding值为0*/
}
body{
	/*background-image: url('img/body.jpg');*/
	background-image: url('img/farm.jpg');
	background-size:100%;

	overflow:auto;/*如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。*//*这个属性最好只个body或者相对小级子元素，像home里一样，若是auto，下拉框在超出div时可能无法实现*/
}
.main{
	overflow:visible;/*	默认值。内容不会被修剪，会呈现在元素框之外。*/
/*	width:1549.71px;/*如果这里还是应用的body默认的网页打开的实时宽度，相当于width不定，会因为父元素的width不定，使在页面变小时，后续子元素变形*/
	/*min-width:1500px;*/
	width:100%;
}
/*longin*/
.longin{
	margin-top:100px;
	margin-left:68%;
	width:300px;
	height:240px;
	background-color:#FFCC99;
	border-radius:20px;/*向元素添加圆角边框*/
}
/*longin-choose*/
.longin-choose{	
	height:40px;
	width:100%;
	/*border:1px solid red;*/
}
.longin-choose-table{
	height:100%;
	width:80%;
	/*margin-top:20px;*/
	margin-left:30px;
}
.longin-choose-table tr{/*对tr修饰好像没有用*/	
}
.longin-choose-table tr td{
	/*background-color:#00FFFF;*/
	/*border-style:groove;*/
	width:33.3%;
	text-align:center;/*字体居中*/
	background-color:#FF9966;
	
}
.longin-choose-table tr td a{
	height:100%;
	text-decoration:none;/*去掉链接的文本下划线*/
	color:#505050;/*深灰*/
	/*text-align:center/*字体居中*//*在这里没什么用，要设置td的属性才行*/
}
.longin-choose-table tr td:hover{
	background-color:#00FFFF;/*鼠标移到td上时背景变色*/
}
.longin-choose-table tr td a:hover{
	color:red;/*鼠标移到链接上时字体变色*/
}
/*longin-form*/
.longin-form{
	width:100%;

}
.longin-form-table{
	width:80%;
	margin-top:10px;
	margin-left:30px;
}
.longin-form-table tr{/*对tr修饰好像没有用*/

	
}
.longin-form-table tr td{
	height:40px;/*变相控制输入框间距*/
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
.register{
	text-align:center;/*字体居中*/
	margin-top:15px;
	margin-left:25%;
	height:20px;
	width:50%;
	background-color:#00BFFF;
	border-radius:6px;/*向元素添加圆角边框*/
	border:1px solid red;
}
.register:hover{
	background-color:#6666FF;
}
.register a{
	text-decoration:none;/*去掉链接的文本下划线*/
	color:#505050;/*深灰*/
	height:100%;
	width:100%
}
.register a:hover{
	color:red;
}
</style>
<meta charset="UTF-8">
<title>登录</title>
</head>
<body>
<div class="main">
	<div class="Nva">
		<jsp:include page="Nva.jsp"/>
	</div>
	<div class="longin">
		<!--<div class="longin-choose">
			<table class="longin-choose-table">
				<tr>
					<td><a href="#">用户</a></td>
					<td><a href="#">商家</a></td>
					<td><a href="#">管理员</a></td>
				</tr>
			</table>
		</div>-->
		<div class="longin-form">
			<form action="longinservlet" method="post">
				<select name=option class="option">
					<option value="User">用户</option>
					<option value="Merchant">商户</option>
					<option value="Administrator">管理员</option>
				</select>
			<table class="longin-form-table">
				<tr><td>账号:</td> <td><input type=text name="logname" class="logname" value=""></td></tr>
				<tr><td>密码:</td> <td><input type=password name="password" class="password" value=""></td></tr>
			</table>
				<input type=submit name="submit" value="提交" class="submit">
				<div class="register" ><a href="register-User.jsp">未有账号，去注册</a></div>
			</form>
		</div>
		<div>
			<%
						String nametype=dataBeanlongin.getnametype();
						int boo=dataBeanlongin.getboo();
						System.out.println(boo);
						System.out.println(nametype);
						if(boo==1){
							if(nametype.equals("")){/*默认是空串*/
						
							}
							//用这种方式来显示jsp:include标记
							if(nametype.equals("Administrator")){
								response.sendRedirect("A-Personal-center-alter.jsp");
							}
							if(nametype.equals("Merchant")){
								response.sendRedirect("M-index.jsp");		
							}
							if(nametype.equals("User")){
								response.sendRedirect("index.jsp");
							}
						}
						if(boo==2){
							out.print("<script type='text/javascript' language='javascript'>alert('账号或密码错误，请重新登录！'); </script>");//双引号下用单引号替代原来的双引号
						}			
				%>		
			</div>
	</div>

</div>
</body>
</html>