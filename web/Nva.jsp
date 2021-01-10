<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dataBeanlongin" class="javabean.longinJavabean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
</head>
<style>
*{
	margin:0px;padding:0px;/*默认是指网页上所有的元素的margin和padding值为0*/
}
body{
	overflow:auto;/*如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。*//*这个属性最好只个body或者相对小级子元素，像home里一样，若是auto，下拉框在超出div时可能无法实现*/
}
.main{
	overflow:visible;/*	默认值。内容不会被修剪，会呈现在元素框之外。*/
/*	width:1549.71px;/*如果这里还是应用的body默认的网页打开的实时宽度，相当于width不定，会因为父元素的width不定，使在页面变小时，后续子元素变形*/
	/*min-width:1500px;*/
	width:100%;
	
}
/*div-1*/
.div-1{
	background-color:#C0C0C0;/*灰*/
	width:100%;
	height:40px;
}
.div-1-ul{
	float:right;/*这里浮动使显示在右*/
	list-style-type:none;/*设置列表标记为空*/
}
.div-1-ul li{
	float:right;/*这里浮动使li水平排列*/
}
.div-1-ul li a{
	text-decoration:none;/*去掉链接的文本下划线*/
	color:#505050;/*深灰*/
	display:block;/*显示块元素的链接，让整体变为可点击链接区域（不只是文本），它允许我们指定宽度*/
	margin-right:20px;
	margin-top:10px;
}
.div-1-ul li:hover a{
	color:red;
}
/*div-2*/
.div-2{
	/*background-color:#F0F0F0;*/
	background-image: url('img/d5.gif');
	background-size:100%;/*大小*/
	width:100%;
	height:200px;
}
.div-2-table{
	height:100%;
	width:100%;
}
.div-2-table tr td{
	width:33%;
}
/*div-2-table-div-1,菜单栏*/
.div-2-table-div-1{/*这里设置了不合适的宽高度后会有问题，导致鼠标移不到下拉栏*/
	margin-top:150px;
	margin-left:60px;
	width:60px;/*要大于图片宽度*/
	height:50px;
	
} 
.div-2-table-div-1 img{
	width:40px;
	height:40px;
}
.div-2-table-div-1 img:hover{

}
.div-2-table-div-1-div-2{
	display:none;/*隐藏*/
	position: absolute;/*这个很重要，position属性指定一个元素（静态的，相对的，绝对或固定）的定位方法的类型。如果没有这个，下拉框出现时会影响其他table里的div大小*/
	width:200px;
    background-color: #f9f9f9;/*乳白色*/
   
}
/*.div-2-table-div-1-div-2 p{
	margin-left:20px;
	margin-top:30px;
	height:15px;
}
.div-2-table-div-1-div-2 p a{
	text-decoration:none;/*去掉链接的文本下划线
	color:#505050;/*深灰
	text-align:center;
	height:100px;
	width:100px;
}*/
.div-2-table-div-1:hover .div-2-table-div-1-div-2{
	display: block;/*显示*/
	
}
/*.div-2-table-div-1-div-2 p a:hover{
	color:red;
}*/
.border{/*分割线*/
	height:1px;
	border:1px solid red;
	width:150px;
}
/*dvi-2-table-dvi-2，搜索栏*//*暂时只做能搜索水果*/
.div-2-table-div-2{
	float:left;
	width:400px;
	height:50px;
	border-style:solid;
	border-color:#00BFFF;/*蓝色*/
}
.input-1{
	height:99%;
	width:80%;
	border:none;
	background-color:#F0F0F0;
}
.submit-1{
	height:100%;
	width:18.5%;
	background-color:#00BFFF;
}
.form{
	height:100%;
	width:100%;
}
/*dvi-2-table-dvi-3,登陆*/
.div-2-table-div-3{
	float:right;/*其中元素向右浮动*/
}
.div-2-table-div-3 img{
	height:100px;
	width:100px;
	border-radius:50px;/*向元素添加圆角边框*/
	margin-top:0px;
	margin-right:200px;
}
.div-2-table-div-3 div{
	text-align: center;
	margin-right:200px;
}
.div-2-table-div-3 div a{
	text-decoration:none;/*去掉链接的文本下划线*/
	color:#505050;/*深灰*/
	display:block;/*显示块元素的链接，让整体变为可点击链接区域（不只是文本），它允许我们指定宽度*/
}
.div-2-table-div-3 div a:hover{
	color:red;
}
</style>
<% 
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%><!-- 绝对路径 -->
<body>
<div class="main">
	<div class="div-1">
		<ul class="div-1-ul">
			<!--<li><a href="#">联系客服</a></li>  -->
			<li><a href="messageboard">留言板</a></li>
		</ul>
	</div>
	<div class="div-2">
		<table class="div-2-table">
			<tr>
				<td>
					<div class="div-2-table-div-1">
							<img src="<%=basePath%>/img/caidan.png">
							<div class="div-2-table-div-1-div-2">
								<jsp:include page="Nva-Home.jsp"/>
								<p class="border"></p>
									<% 
									//String nametype=(String)session.getAttribute("nametype");
									//boolean one;
									//String Administrator="Administrator";
									String nametype=dataBeanlongin.getnametype();
									//one=nametype.equals(Administrator);
									//System.out.println(Administrator);
									//System.out.println(nametype);
									//System.out.println(one);
									
									if(nametype.equals("")){/*默认是空串*/
										
									}
									//用这种方式来显示jsp:include标记
									if(nametype.equals("Administrator")){%>
										<jsp:include page="Nva-Administrator.jsp"/>	
									<%}
									if(nametype.equals("Merchant")){//商户的nva砍掉，只留下登出就行%>
										<jsp:include page="Nva-Merchant.jsp"/>		
									<%}
									if(nametype.equals("User")){%>
										<jsp:include page="Nva-User.jsp"/>		
									<%}
									%>
								<!--<jsp:include page="Nva-Administrator.jsp"/>
								<p class="border"></p>
								<jsp:include page="Nva-Merchant.jsp"/>
								<p class="border"></p>
								<jsp:include page="Nva-User.jsp"/>-->
							</div>
					</div>
				</td>
				<td>
					<div class="div-2-table-div-2">
						<form name="input" action=searchservlet method="post" class="form">
							<input type="text" name="Search" class="input-1" value="请输入产品名字">
							<input type="submit" name="submit" value="搜索" class="submit-1">
						</form>
					</div>
				</td>
				<td><div class="div-2-table-div-3"><img src="<%=basePath%>/img/example.jpg"/>
				<div>
				<% 
					//String name=(String)session.getAttribute("logname");
					String name=dataBeanlongin.getlogname();
					String BackNews=dataBeanlongin.getBackNews();
					/*if(name==null){/*默认是null*/
						//out.print("<a href='longin.jsp'>欢迎！请登录</a>");
					//	out.print("<a href='longin.jsp'>"+name+"</a>");
					//}
					//else{
					//	out.print("<a href='A-Personal-center.jsp'>"+name+"</a>");		
					//}
					if(BackNews.equals("请登录")){/*默认是null*/
						//out.print("<a href='longin.jsp'>欢迎！请登录</a>");
						out.print("<a href='longin.jsp'>"+BackNews+"</a>");
					}
					if(BackNews.equals("已经登录成功")){
						if(nametype.equals("")){/*默认是空串*/
							
						}
						//用这种方式来显示jsp:include标记
						if(nametype.equals("Administrator")){
							out.print("<a href='apersonalServlet'>"+name+"</a>");
						}
						if(nametype.equals("Merchant")){
							out.print("<a href='M-index.jsp'>"+name+"</a>");		
						}
						if(nametype.equals("User")){
							out.print("<a href='index.jsp'>"+name+"</a>");
						}	
					}
				%>
				</div>
				</div></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>