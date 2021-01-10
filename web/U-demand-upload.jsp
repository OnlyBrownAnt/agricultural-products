<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品信息</title>
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
	<h1 id="h">求购需求</h1>
	
	<div class="dvi">
		<form action="uorderuploadservlet"  method="post">
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;发布摘要</span></label>
				<input type="text" name="Ddigest"  class="form_input">
			</div>
			<div class="input">		
				<label><span>&nbsp;&nbsp;&nbsp;发布要求</span></label>
				<input type="text" name="Dmessage"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;发布时间</span></label>
				<input type="text" name="Dtime"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布者</span></label>
				<input type="text" name="Unum"  class="form_input">
			</div>
			<input type="submit" class="submit" value="提交" >
		</form>
	</div>
</div>
</body>
</html>