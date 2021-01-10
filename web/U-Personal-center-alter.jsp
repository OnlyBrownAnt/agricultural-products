<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.sun.rowset.CachedRowSetImpl"%>
<jsp:useBean id="dataBeanlongin" class="javabean.longinJavabean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<title>个人信息修改</title>
<style>
*{margin:0px; padding:0px;}
body{
	/*background-image: url('img/body.jpg');*/
	/*background-image: url('img/d1.gif');*/
	background-image: url('img/farm.jpg');
	background-size:100%;

	overflow:auto;
}
.main{
	overflow:visible;/*	默认值。内容不会被修剪，会呈现在元素框之外。*/
/*	width:1549.71px;/*如果这里还是应用的body默认的网页打开的实时宽度，相当于width不定，会因为父元素的width不定，使在页面变小时，后续子元素变形*/
	/*min-width:1500px;*/
	width:100%;
}
.content{
	margin-top:100px;
	margin-left:5%;
	width:90%;
	/*border: 1px solid red;*/
	height:600px;
	/*background-color:#f9f9f9;*/
}
.content-form-table{ 
	margin-left:25%;
	margin-top:50px;
	width:50%;
	background-color:#f9f9f9;
	border-radius:20px;/*向元素添加圆角边框*/
}
.td-p{
	width:20%;
}
.td-input{
	width:80%
}
.content-form-table tr td p{
	/*	margin-top:20px;*/
		text-align:right;/*字体向右对其*/
		/*margin-top:40px;/*这个没用的，用height*/
}
.content-form{
	/*padding-top:50px;/*填充顶部空白*/
}

.input{
	margin-top:10px;
	height:50px;
	border:none;/*去掉边框*/
	width:100%;
	border-radius:3px;/*向元素添加圆角边框*/
	background-color:#F0F0F0;/*灰白色，导航栏背景色*/
}
.submit{
	margin-top:15px;
	margin-left:12%;
	height:30px;
	width:50%;
	background-color:#00BFFF;
	border-radius:6px;/*向元素添加圆角边框*/
}
</style>
</head>
<body>
<div class="main">
	<div class="Nav">
	<jsp:include page="Nva.jsp"/>
	</div>
	<div class="content">
	<% 
			CachedRowSetImpl rowSet=dataBeanlongin.getRowSetUUser();
			
				rowSet.beforeFirst();//将光标定位到结果集中第一行之前。//有时要用有时又不需要
				while(rowSet.next()){//next();滚动参考resultset的方法
			%>
			<form name="content-form" action="saveU" method="post" >	
				<table class="content-form-table">
				<tr>
				<td class="td-p"><p>账号：</p></td><td class="td-input"><%out.print(rowSet.getString(1));%><input class="input" type="hidden" name="Unum" value="<%out.print(rowSet.getString(1));%>"></td>
				</tr>
				<tr>
				<td class="td-p"><p>姓名：</p></td><td class="td-input"><input class="input"  type="text" name="Uname" value="<%out.print(rowSet.getString(3));%>"></td>
				</tr>
				<tr>
				<td class="td-p"><p>性别：</p></td><td class="td-input"><input class="input"  type="text" name="Usex" value="<%out.print(rowSet.getString(4));%>"></td>
				</tr>
				<tr>
				<td class="td-p"><p>电话：</p></td><td class="td-input"><input class="input"  type="text" name="Uphone" value="<%out.print(rowSet.getString(6));%>"></td>
				</tr>
				<tr>
				<td class="td-p"><p>邮箱：</p></td><td class="td-input"><input class="input"  type="text" name="Uemail" value="<%out.print(rowSet.getString(7));%>"></td>
				</tr>
				<tr>
				<td class="td-p"><p>身份证号：</p></td><td class="td-input"><input class="input"  type="text" name="Uidcard" value="<%out.print(rowSet.getString(5));%>"></td>
				</tr>
				<tr>
				<td class="td-p"><p>家庭地址：</p></td><td class="td-input"><input class="input"  type="text" name="Uaddress" value="<%out.print(rowSet.getString(8));%>"></td>
				</tr>
				<tr>
				<td></td><td><input class="submit"  type="submit" value="确认修改" name="submit"></td>
				</tr>
				</table>
			</form>
			<% 
				}
			%>
	</div>
</div>
</body>
</html>