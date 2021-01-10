<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href=css/c.css rel="stylesheet"> 
	 <script type="application/javascript" src="js/awesomechart.js"> </script>
</head>
<body>
<div class="Nva">
	<jsp:include page="Nva.jsp"/>
</div>
<div class="left-menu">
  <div class="logo"><i class="fa fa-align-justify"></i>
    <div>主页</div>
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
<div class="ma">


<div>
	<div class="chart_container_centered">

            <canvas id="chartCanvas13" width="600" height="400">   
            </canvas>

    </div>
        
        <script type="application/javascript">
 
            var chart13 = new AwesomeChart('chartCanvas13');
            chart13.chartType = "pareto";
            chart13.title = "近一周访问人数记录";
            chart13.data = [51,31,10,4,7,8,20];
            chart13.labels = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
            chart13.draw();
            
        </script>
</div>

</div>
</body>
</html>