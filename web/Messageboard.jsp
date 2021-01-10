<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javabean.MessageBoardData" %>
<%@ page import="javabean.longinJavabean" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl"%>
<jsp:useBean id="MessageBoardData" class="javabean.MessageBoardData" scope="application"/>
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
/*Add*/
.Add{
	margin-top:30px;
	margin-left:2%;
	float:left;
	width:14%;
}
.input{
	width:100%;
	height:200px;
	border-radius:20px;/*向元素添加圆角边框*/
}
.submit{
	margin-top:5px;
	margin-left:10%;
	width:80%;
	height:50px;
	border-radius:10px;/*向元素添加圆角边框*/
}
/*show*/
.show{
	margin-top:100px;
	margin-left:5%;
	width:90%;
}
.show table{
	margin-top:100px;
	margin-left:15%;
	width:70%;
	border-style:groove;
	background-color:#f9f9f9;
}
.show table tr{
}
.show table tr td,th{
	width:25%;
	height:30px;
	border-style:groove;
	
}
.p2{
	
}
.p1{
	float:right;
}
.p3{
	float:right;
}


</style>
<meta charset="UTF-8">
<title>留言板</title>
</head>
<body>

<div class="main">
	<div class="Nva">
		<jsp:include page="Nva.jsp"/>
	</div>
	<div class="Add">
		<form action=Messageup method="post">
			<div class="input"><input type="text" name="input" value="略略略！输入你想说的话" class="input"></div>
			<div class="submit"><input type=submit name="submit" value="提交"  class="submit"></div>
			<input type="hidden" name="hidden" value="<%=dataBeanlongin.getlogname() %>">
		</form>
	</div>
	<div class="show">
		<table>
		<tr>
			<th>留言版</th>
		</tr>
		<%//在页面调用其他的javaBean时，不知道为什么没用，先在servlet上把一个javabean里的需要的数据存在这个页面需要用的javabean里，直接只用一个javabean就好
			CachedRowSetImpl rowSet=MessageBoardData.getRowSet();
			System.out.println(rowSet);
			//rowSet.beforeFirst();//将光标定位到结果集中第一行之前。
			if(dataBeanlongin.getBackNews().equals("已经登录成功")){
				//out.print("<script type='text/javascript' language='javascript'>alert('已经登录成功'); </script>");//双引号下用单引号替代原来的双引号
			}else{
				//out.print("<script type='text/javascript' language='javascript'>alert('"+dataBeanlongin.getBackNews()+"'); </script>");//双引号下用单引号替代原来的双引号
			}
			while(rowSet.next()){//next();滚动参考resultset的方法
				out.print("<tr>");
				out.print("<td>");
				out.print("<p class='p2'>留言消息:"+rowSet.getString(2)+"</p>");
				out.print("<p class='p1'>留言者:"+rowSet.getString(1)+"</p>");
				out.print("<p class='p3'>留言时间:"+rowSet.getString(3)+"</p>");
				out.print("<p>");
				out.print("<tr>");
			}
			rowSet.close();
			
		%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
		</table>
	</div>
</div>
</body>
</html>