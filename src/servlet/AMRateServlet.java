package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.rowset.CachedRowSetImpl;

import javabean.Conn;
import javabean.DemandData;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/AMRateServlet")
public class AMRateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CachedRowSetImpl rowSet=null;//CachedRowSetImpl对象
	Conn conn = new Conn();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AMRateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//可能是我其他设置的编码都是UTF-8，所以这里不知道为什么重新编码反而会导致乱码。
	public String handleString(String s) {//自定义转码函数，在这个servlet里传入String时会有乱码，需要转码一下
		try {
			byte bb[]=s.getBytes("ISO-8859-1");
			s=new String(bb);
		}catch(Exception ee) {}
		return s;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");//这里编码设为大写的UTF-8即可
		String rateup=request.getParameter("rateup");
		String ratedown=request.getParameter("ratedown");
		String Mnum=request.getParameter("Mnum");
		String RateOld=request.getParameter("RateOld");
		String RateNew = null;
		if(rateup!=null) {
			if(RateOld.equals("A")) {
				RateNew="A";
			}
			if(RateOld.equals("B")) {
				RateNew="A";
			}
			if(RateOld.equals("C")) {
				RateNew="B";
			}
		}
		if(ratedown!=null){
			if(RateOld.equals("A")) {
				RateNew="B";
			}
			if(RateOld.equals("B")) {
				RateNew="C";
			}
			if(RateOld.equals("C")) {
				RateNew="C";
			}
		}
		//doGet(request, response);
		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;

		try {
			con=conn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);//声明sql语句对象，并使type取值。
			String condition="update merchant set Mrate='"+RateNew+"' where Mnum='"+Mnum+"'";
			sql.executeUpdate(condition);//直接运行设计好的sql语句

			con.close();//关闭连接
			}catch(SQLException e) {   
				System.out.println(e);
				fail(request,response,"调整失败:"+e.toString());
		}
		response.sendRedirect("A-Merchant-management.jsp");
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Message-board.jsp");
		//重定向和跳转
	}

public void fail(HttpServletRequest request, HttpServletResponse response,String backnews) throws ServletException, IOException {
	// TODO Auto-generated method stub
	//response.getWriter().append("Served at: ").append(request.getContextPath());
	// TODO Auto-generated method stub
			//response.getWriter().append("Served at(get): ").append(request.getContextPath());
	response.setContentType("text/html;charset=Gb2312");
	try {
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		out.println("<h2>"+backnews+"</h2>");
		out.println("返回");
		out.println("<a href=A-Merchant-management.jsp>重新输入</a>");
		out.println("</body></html>");
	}catch(IOException exp) {}
	}
}


