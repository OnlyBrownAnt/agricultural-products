<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>

<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="UTF-8">
<title>商品信息</title>
<link href=css/c.css rel="stylesheet"> 
</head>
<body>
<div class="Nva">
	<jsp:include page="Nva.jsp"/>
</div>
<div class="left-menu">
  <div class="logo"><i class="fa fa-align-justify"></i>
    <div><a href="M-index.jsp" id="hover">主页</a></div>
  </div>
  <div class="accordion">
    <div class="section">
      <input type="radio" name="accordion-1" id="section-1" checked="checked"/>
      <label for="section-1"><span>个人信息</span></label>
      <div class="content">
        <ul>
          <li><a href="person.jsp" id="hover"><i class="fa fa-inbox"></i><span>修改信息</span></a></li>
        </ul>
      </div>
    </div>
    <div class="section">
      <input type="radio" name="accordion-1" id="section-2" value="toggle"/>
      <label for="section-2"><span>产品信息</span></label>
      <div class="content">
        <ul>
          <li><a href="MApply.jsp" id="hover"><i class="fa fa-cog"></i><span>产品上传</span></a></li>
        </ul>
      </div>
    </div>
    <div class="section">
      <input type="radio" name="accordion-1" id="section-3" value="toggle"/>
      <label for="section-3"><span>仓库管理</span></label>
      <div class="content">
        <ul>
          <li><a href="ShowMApply.jsp" id="hover"><i class="fa fa-coffee"></i><span>产品展示</span></a></li>
        </ul>
      </div>
    </div>

  </div>
</div>
<div align="center" class="center">
	<h1 id="h">产品上传</h1>
	
	<div>
		<form action="mproduct.jsp"  method="post">
			<div class="input">	
				<label><span>产品</span></label>
				<input type="file" name="maimg"  class="form_input">
			</div>
			<div class="input">	
				<label><span>产品识别码</span></label>
				<input type="text" name="manum"  class="form_input">
			</div>
			<div class="input">	
			
				<label><span>&nbsp;&nbsp;&nbsp;产品名称</span></label>
				<input type="text" name="maname"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;发布单位</span></label>
				<input type="text" name="mnum"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;更新时间</span></label>
				<input type="text" name="maupdatetime"  class="form_input">
			</div>
			<div class="input">	
				<label><span>联系人姓名</span></label>
				<input type="text" name="macontactname"  class="form_input">
			</div>
			<div class="input">	
				<label><span>联系人手机</span></label>
				<input type="text" name="maphone"  class="form_input">
			</div>
			<div class="input">	
				<label><span>联系人邮箱</span></label>
				<input type="text" name="maemail"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;发货地址</span></label>
				<input type="text" name="madeliveryaddress"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单价</span></label>
				<input type="text" name="maunitprice"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;起批量</span></label>
				<input type="text" name="mamin"  class="form_input">
			</div>
			<div class="input">	
				<label><span>&nbsp;&nbsp;&nbsp;备注留言</span></label>
				<input type="text" name="mamessage"  class="form_input">
			</div>
			<input type="submit" class="submit" value="提交" >
		</form>
	</div>
</div>
</body>
</html>