package servlet;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import com.sun.rowset.CachedRowSetImpl;

import javabean.Conn;
import javabean.longinJavabean;

/**
 * Servlet implementation class PSoldOutServlet
 */
@WebServlet("/PSoldOutServlet")
public class PSoldOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CachedRowSetImpl rowSet=null;//CachedRowSetImpl对象
	Conn conn = new Conn();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PSoldOutServlet() {
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
		//response.getWriter().append("Served at(get): ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");//这里编码设为大写的UTF-8即可
		String Pnum=request.getParameter("Pnum");
		//System.out.print(Pnum);
		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;
		String condition="";
		try {
			condition="delete  from product where Pnum='"+Pnum+"'";
			
			con=conn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);//声明sql语句对象，并使type取值。
			sql.executeUpdate(condition);
			//rs=sql.executeQuery(condition);//留言相关信息存在messageboard表中
			con.close();//关闭连接
			}catch(SQLException e) {    
		}
		response.sendRedirect("A-Product-management.jsp");
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Message-board.jsp");
		//重定向和跳转
	}

}
