package servlet;

import javabean.Conn;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderUpServlet
 */
@WebServlet("/OrderUpServlet")
public class OrderUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Conn conn = new Conn();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");//这里编码设为大写的UTF-8即可
		String Pnum=request.getParameter("Pnum");
		String Unum=request.getParameter("Unum");
		String Oname=request.getParameter("Oname");
		String Oaddress=request.getParameter("Oaddress");
		String Ophoen=request.getParameter("Ophoen");
		String Omessage=request.getParameter("Omessage");
		String Onum=Pnum+"1";
		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;
		String condition="";
		try {
			con=conn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);//声明sql语句对象，并使type取值。
			rs=sql.executeQuery("Select * from product where Pnum='"+Pnum+"'");//留言相关信息存在messageboard表中
			if(rs.next())//判断是否存在该账号
			{
				condition="INSERT INTO uorder values"+"("+"'"+Onum+"','"+Unum+"','"+Pnum+"','"+Oname+"','"+Oaddress+"','"+Ophoen+"','"+Omessage+"','"+"null"+"'"+")";
				sql.executeUpdate(condition);
			}
			
			con.close();//关闭连接
			}catch(SQLException e) {   
				System.out.println(e);
		}
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out=response.getWriter();
			out.println("<html><body>");
			out.println("已经下单成功，2秒后返回");
			response.setHeader("refresh", "2;URL=recentProduct.jsp");
			out.println("</body></html>");
		}catch(IOException exp) {}
	}

}
