<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javabean.MessageBoardData" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl"%>
<jsp:useBean id="NewsData" class="javabean.NewsData" scope="application"/>
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

/*table*/
.show{
	margin-top:100px;
	margin-left:5%;
	width:90%;
	background-color:#f9f9f9;
}
.show table{
	width:100%;
	/*margin-left:15%;*/
	border-style:groove;
}
.show table tr{

}
.show table tr td{
	height:210px;
	border-style:groove;	
}
.show table tr tdp{
	margin-left:15px;
	margin-top:0px;/*margin:上右下左*/
	/*line-height:70%;*//*段内文字间距*/
}
.p2{
	margin-top:5px;
	margin-bottom:0px;
	margin-left:10%;
}
.p1{
	margin-bottom:0px;
}
.p3{
	margin-top:0px;
	margin-bottom:0px;
}
.p4{
	
}
.p5{
	float:right;
	margin-bottom:10px;
	margin-right:20px;
}
.td-button{

}
</style>
<meta charset="UTF-8">
<title>产品</title>
</head>
<body>
<div class="main">
	<div class="Nva">
		<jsp:include page="Nva.jsp"/>
	</div>
	<div class="show">
	<!--  <img src="product/P1.png"/>-->
		<table>
		<%
			CachedRowSetImpl rowSet=NewsData.getRowSet();
		
			if(rowSet==null){
				out.print("<script type='text/javascript' language='javascript'>alert('还未有产品！'); </script>");//双引号下用单引号替代原来的双引号
				return ;
			}
			//rowSet.beforeFirst();//将光标定位到结果集中第一行之前。
			while(rowSet.next()){//next();滚动参考resultset的方法
				out.print("<tr>");
				out.print("<td>");
				out.print("<p class='p2'>新闻名称:"+rowSet.getString(2)+"</p>");
				out.print("<p class='p1'>新闻编号:"+rowSet.getString(1)+"</p>");
				out.print("<p class='p3'>新闻时间:"+rowSet.getString(3)+"</p>");
				out.print("<p class='p4'>新闻内容:<br>"+rowSet.getString(4)+"</p>");		
				out.print("<p class='p5'>新闻作者:"+rowSet.getString(5));
				out.print("来源:"+rowSet.getString(6)+"</p>");
				out.print("</td>");
				out.print("</tr>");
				
			}
			rowSet.close();
		%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
		</table>

		</div>
</div>
</body>
</html>