<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javabean.MessageBoardData" %>
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
.show table tr th{
	height:50px;
	border-style:groove;	
}
.show table tr td{
	height:120px;
	border-style:groove;	
}
.show table tr td p{
	margin-left:10px;
	margin-top:0px;/*上*//*margin:上右下左*/
	margin-bottom:10px;/*下*/
	/*line-height:70%;*//*段内文字间距*/
}

.th1{/*产品图片*/
	width:170px;
	height:50px;
	border-style:groove;
}
.th2{/*产品介绍*/
	width:300px;
	height:50px;
	border-style:groove;
}
.th3{/*产品附加*/
/*宽度未限制*/
	height:50px;
	border-style:groove;
}
.th4{/*功能*/
	width:100px;
	height:50px;
	border-style:groove;
}

.td1{
	border-style:groove;
}
.td2{
	border-style:groove;
}
.td3{
	border-style:groove;
}
.td-button{

}

.td-button-submit1{
	margin-left:10%;
	width:80%;
	height:60px;
	margin-bottom:5px;
}
.td-button-submit2{
	margin-left:10%;
	width:80%;
	height:60px;
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
		<tr>
			<th class="th1">账号信息</th>
			<th class="th2">联系方式</th>
			<th class="th3">附加信息</th>
			<th class="th4">功能</th>
		</tr>
		<%
			CachedRowSetImpl rowSet=dataBeanlongin.getRowSetMerchant();
			/*System.out.print(dataBeanlongin.getBackNews());
			System.out.print(dataBeanlongin.getboo());
			System.out.print(dataBeanlongin.getnametype());
			System.out.print(dataBeanlongin.getlogname());*/
			
			//rowSet.beforeFirst();//将光标定位到结果集中第一行之前。
			while(rowSet.next()){//next();滚动参考resultset的方法
				out.print("<tr>");
				out.print("<td class='td1'>");
				out.print("<p>账号:"+rowSet.getString(1)+"</p>");
				String Mnum=rowSet.getString(1);
				out.print("<p>评级:"+rowSet.getString(12)+"</p>");
				String RateOld=rowSet.getString(12);
				out.print("<p>姓名:"+rowSet.getString(3)+"</p>");
				out.print("<p>性别:"+rowSet.getString(4)+"</p>");
				out.print("</td>");
				out.print("<td class='td2'>");
				out.print("<p>电话:"+rowSet.getString(6)+"</p>");
				out.print("<p>邮箱:"+rowSet.getString(7)+"</p>");
				out.print("<p>发货地址:"+rowSet.getString(8)+"</p>");
				out.print("</td>");
				out.print("<td class='td3'>");	
				out.print("<p>民族:"+rowSet.getString(9)+"</p>");		
				out.print("<p>籍贯:"+rowSet.getString(10)+"</p>");
				out.print("<p>生日:"+rowSet.getString(11)+"</p>");
				out.print("<p>身份证号:"+rowSet.getString(5)+"</p>");
				out.print("</td>");
				out.print("<td class='td-button'>");
				out.print("<form action='amrateservlet' method='post'>");
				out.print("<input type='hidden' name='Mnum' value= "+Mnum+">");
				out.print("<input type='hidden' name='RateOld' value= "+RateOld+">");
				out.print("<input class='td-button-submit1' type='submit' name='rateup' value='上调评级'>");
				out.print("</form>");
				out.print("<form action='amrateservlet' method='post'>");
				out.print("<input type='hidden' name='Mnum' value= "+Mnum+">");
				out.print("<input type='hidden' name='RateOld' value= "+RateOld+">");
				out.print("<input class='td-button-submit2' type='submit' name='ratedown' value='下调评级'>");
				out.print("</form>");
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