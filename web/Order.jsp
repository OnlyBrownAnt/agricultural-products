<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="com.sun.rowset.CachedRowSetImpl"%>
   <jsp:useBean id="dataBeanlongin" class="javabean.longinJavabean" scope="session"/>
   <jsp:useBean id="recentProductData" class="javabean.recentProductData" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>下订单</title>
<style>
.dvi{
	width:70%;
}

</style>
<link href=css/c.css rel="stylesheet">
</head>
<body>
<div class="Nva">
	<jsp:include page="Nva.jsp"/>
</div>
<div align="center">
	<h1 id="h">订单</h1>
	
	<div class="dvi">
		<form action=orderup  method="post">
		<%
			String Pnum=request.getParameter("Pnum");
		%>
			<div class="input">	
				<label><span>&nbsp;&nbsp;产品识别码&nbsp;</span></label>
				<input type="text" name="Pnum"  class="form_input" value=<%=request.getParameter("Pnum")%>>
			</div>
			<div class="input">		
				<label><span>&nbsp;&nbsp;&nbsp;下单用户&nbsp;&nbsp;&nbsp;</span></label>
				<input type="text" name="Unum"  class="form_input" value="<%out.print(dataBeanlongin.getlogname());%>">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;&nbsp;收货人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label>
				<input type="text" name="Oname"  class="form_input">
			</div>
						<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;收货地址&nbsp;&nbsp;&nbsp;</span></label>
				<input type="text" name="Oaddress"  class="form_input">
			</div>
			<div class="input">	
				<label><span>收货人手机号</span></label>
				<input type="text" name="Ophoen"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留言&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label>
				<input type="text" name="Omessage"  class="form_input">
			</div>
		<!--<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;价格总和&nbsp;&nbsp;&nbsp;&nbsp;</span></label>
				<input type="text" name="Omessage"  class="form_input">
			</div> -->	
			<input type="submit" class="submit" value="确认购买" >
		</form>
	</div>
</div>
</body>
</html>