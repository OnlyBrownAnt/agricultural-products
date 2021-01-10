<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="javabean.Conn" %>
<html>
<head>
<meta charset="UTF-8">
<title>产品显示</title>
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
.submita{
	width: 65px;
    height: 45px;
    margin: 2.5em auto 0;
    background: rgb(240, 235, 229);
    -webkit-border-radius: 10px;
    -o-border-radius: 10px;
    -ms-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    -webkit-transition: 0.5s all;
    -o-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -ms-transition: 0.5s all;
    transition: 0.5s all;
    font-size: 15px;  

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
	height:210px;
	border-style:groove;	
}
.show table tr td p{
	margin-left:15px;
	margin-top:15px;/*margin:上右下左*/
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

.td-img{
	border-style:groove;
}
.td-img img{
	margin-left:5%;
	width:150px;
	height:150px;
}
.td-show{
	border-style:groove;
}
.td-show-number{
	color:red;
}
.td-showadd{
	border-style:groove;
}
.td-button{

}

.td-button-submit{
	margin-left:10%;
	width:80%;
	height:60px;
}
</style>
<link href=css/c.css rel="stylesheet"> 
</head>
<body>

<div class="main">
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
	<div class="show">
	<!--  <img src="product/P1.png"/>-->
		<table>
		<tr>
			<th class="th1">产品图片</th>
			<th class="th2">产品介绍</th>
			<th class="th3">产品附加</th>
			<th class="th4">管理</th>
		</tr>
		<%  
        try {
            Conn connn = new Conn();
            Connection conn = connn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象

            if(conn != null){  
           
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "SELECT *FROM product;";  //查询语句
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);   
                 
                while(rs.next()){//next();滚动参考resultset的方法
    				/*out.print("<tr>");
    				out.print("<td>"+rs.getString(1)+"</td>");
    				out.print("<td><img src='product/"+rs.getString(2)+"' alt=images></td>");
    				//out.print("<td>"+rowSet.getString(2)+"</td>");
    				out.print("<td>"+rs.getString(3)+"</td>");
    				out.print("<td>"+rs.getString(4)+"</td>");
    				out.print("<td>"+rs.getString(5)+"</td>");
    				out.print("<td>"+rs.getString(6)+"</td>");
    				out.print("<td>"+rs.getString(7)+"</td>");
    				out.print("<td>"+rs.getString(8)+"</td>");
    				out.print("<td>"+rs.getString(9)+"</td>");
    				out.print("<td>"+rs.getString(10)+"元/斤</td>");
    				out.print("<td>"+rs.getString(11)+"斤</td>");
    				out.print("<td>"+rs.getString(12)+"</td>");
    				out.print("<tr>");*/
        			//rowSet.beforeFirst();//将光标定位到结果集中第一行之前。
        			while(rs.next()){//next();滚动参考resultset的方法
        				out.print("<tr>");
        				out.print("<td class='td-img'>");
        				String Pnum=rs.getString(1);
        				out.print("<p>产品识别码:"+rs.getString(1)+"</p>");
        				out.print("<img src='"+"product/"+rs.getString(2)+"'>");
        				out.print("</td>");
        				//out.print("<td>"+rowSet.getString(2)+"</td>");
        				out.print("<td class='td-show'>");
        				out.print("<p>产品名称:"+rs.getString(3)+"</p>");
        				out.print("<p>发布单位:"+rs.getString(4)+"</p>");
        				out.print("<p>更新时间:"+rs.getString(5)+"</p>");
        				out.print("<p class='td-show-number'>单价:"+rs.getString(10)+"元/斤</p>");
        				out.print("<p class='td-show-number'>起批量:"+rs.getString(11)+"斤</p>");
        				out.print("</td>");
        				out.print("<td class='td-showadd'>");			
        				out.print("<p>联系人姓名:"+rs.getString(6)+"</p>");
        				out.print("<p>联系人手机号码:"+rs.getString(7)+"</p>");
        				out.print("<p>联系邮箱:"+rs.getString(8)+"</p>");
        				out.print("<p>发货地址:"+rs.getString(9)+"</p>");
        				//out.print("<td class='td-show-message'>");
        				out.print("<p>备注留言:"+rs.getString(12)+"</p>");
        				out.print("</td>");
        				out.print("<td class='td-button'>");
        				out.print("<form action='psoldoutservlet' method='post'>");
        				out.print("<input type='hidden' name='Pnum' value= "+Pnum+">");
        				out.print("<input class='td-button-submit' type='submit' name='submit' value='下架'>");
        				out.print("</form>");
        				out.print("</td>");
        				out.print("</tr>");
        				
        			}
    			}
            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
        }  
	%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
		</table>
	</div>
	<div align="center">
		<button class="submita" onclick="window.location.href='MApply.jsp'">点击返回</button>
	</div>
</div>
	
</body>
</html>