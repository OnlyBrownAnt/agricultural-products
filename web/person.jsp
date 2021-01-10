<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="Person" class="javabean.Register" scope="session"></jsp:useBean>
<html>
<head>
<link href="css/c.css" rel="Stylesheet"> <!-- rel="Stylesheet"定义一个外部加载的样式表 -->
<meta charset="UTF-8">
<title>个人信息</title>
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
          <li><i class="fa fa-inbox"></i><span>修改信息</span></li>
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
		<h1 id="h">个人信息</h1>
	<div>
		<form action="person" name="form" method="post">
			<div class="input">	
				<label><span>姓&nbsp;&nbsp;&nbsp;名</span></label>
				<input type="text" name="mname"  class="form_input" value="${mname}">
			</div>
			<div class="input">
				<label><span>性&nbsp;&nbsp;&nbsp;别</span></label>
				<input type="text" name="msex"  class="form_input" value="${msex}">	
			</div>
			<div class="input">
				<label><span>身份证</span></label>
				<input type="text" name="midcard"  class="form_input" value="${midcard}">
			</div>
			<div class="input">
				<label><span>电&nbsp;&nbsp;&nbsp;话</span></label>
				<input type="text" name="mphone"  class="form_input" value="${mphone}">
			</div>
			<div class="input">
				<label><span>邮&nbsp;&nbsp;&nbsp;箱</span></label>
				<input type="text" name="memail"  class="form_input" value="${memail}">
			</div>
			<div class="input">
				<label><span>地&nbsp;&nbsp;&nbsp;址</span></label>
				<input type="text" name="maddress"  class="form_input" value="${maddress}">
			</div>
			<div class="input">
				<label><span>籍&nbsp;&nbsp;&nbsp;贯</span></label>
				<input type="text" name="mbirthplace"  class="form_input" value="${mbirthplace}">
			</div>
			<div class="input">
				<label><span>民&nbsp;&nbsp;&nbsp;族</span></label>
				<input type="text" name="mnationality"  class="form_input" value="${mnationality}">
			</div>
			<div class="input">
				<label><span>生&nbsp;&nbsp;&nbsp;日</span></label>
				<input type="text" name="mbirthday"  class="form_input" value="${mbirthday}">
			</div>
			<div class="input">
				<label><span>评&nbsp;&nbsp;&nbsp;级</span></label>
				<input type="text" name="mrate"  class="form_input" value="${mrate}">
			</div>
			
			<div>
			<input type="submit" class="submit" value="保存" >
			</div>
		</form>
	</div>
</div>
</body>
</html>