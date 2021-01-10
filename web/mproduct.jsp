<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href=css/c.css rel="stylesheet"> 
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="conn4" class="javabean.Conn" scope="session" />
	<%
		
		request.setCharacterEncoding("utf-8");
		String manu = request.getParameter("manum");
		int manum = Integer.parseInt(manu);
		String filename = request.getParameter("maimg");
		System.out.println(filename);		
		String maname = request.getParameter("maname");			
		String mnum = request.getParameter("mnum");
		String maupdatetime = request.getParameter("maupdatetime");
		String []str = maupdatetime.split("[-/]");
		int year = Integer.parseInt(str[0]);
		int month = Integer.parseInt(str[1]);
		int day = Integer.parseInt(str[2]);
		Calendar calendar = Calendar.getInstance();
		calendar.set(year,month-1,day);
		Date date = new java.sql.Date(calendar.getTimeInMillis());
		
		String macontactname = request.getParameter("macontactname");
		String maphone = request.getParameter("maphone");
		String maemail = request.getParameter("maemail");
		String madeliveryaddress = request.getParameter("madeliveryaddress");
		String a = request.getParameter("maunitprice");
		double maunitprice = Double.parseDouble(a);
		String mamin = request.getParameter("mamin");
		String mamessage = request.getParameter("mamessage");

		String sql1 = "select * from product";
		Statement stmt = conn4.getConnection().createStatement();
		System.out.println("连接成功");
		ResultSet rs = stmt.executeQuery(sql1);
		rs.last();
		
		String sql = "insert into product(Pnum,Pimg,Pname,Mnum,Pupdatetime,Pcontactname,"
				+"Pphone,Pemail,Pdeliveryaddress,Punitprice,Pmin,Pmessage)"
				+"values(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn4.getConnection().prepareStatement(sql);
		pstmt.setInt(1, manum);
		pstmt.setString(2,filename);
		pstmt.setString(3,maname);		   
		pstmt.setString(4,mnum);
		pstmt.setDate(5,date);
		pstmt.setString(6,macontactname);
		pstmt.setString(7,maphone);
		pstmt.setString(8,maemail);
		pstmt.setString(9,madeliveryaddress);
		pstmt.setDouble(10,maunitprice);
		pstmt.setString(11,mamin);
		pstmt.setString(12,mamessage);
	
		
		//out.print(bi.available());
		try {
			pstmt.executeUpdate();
		} catch (Exception e) {
			//out.print(sql);
			out.print(e.getMessage());
		}
		out.println("<html><body align=center>");
		out.println("<h1 id=h>"+"Success,You Have Insert an Image Successfully"+"</h1>");
		out.print("<a href= MApply.jsp id=hover>点击返回</a>");
		out.print("</body></html>");
	%>
</body>
</html>