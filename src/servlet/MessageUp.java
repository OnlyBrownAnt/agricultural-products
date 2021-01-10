package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.rowset.CachedRowSetImpl;
import javabean.Conn;

/**
 * Servlet implementation class MessageUp
 */
@WebServlet("/MessageUp")
public class MessageUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CachedRowSetImpl rowSet=null;//CachedRowSetImpl对象
	Conn conn = new Conn();
	/**
     * @see HttpServlet#HttpServlet()
     */
    public MessageUp() {
        super();
        // TODO Auto-generated constructor stub
    }
    /*init方法重写，这里是加载mysql数据库驱动*/
    public void init(ServletConfig config)throws ServletException{
    	super.init(config);
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    	}catch(Exception e){}
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
		String input=request.getParameter("input");
		String hidden=request.getParameter("hidden");	
		if(hidden.equals("")) {
			response.setContentType("text/html;charset=UTF-8");
			try {
				PrintWriter out=response.getWriter();
				out.println("<html><body>");
				out.println("未登录，请登陆后留言，2秒后返回");
				response.setHeader("refresh", "2;URL=Messageboard.jsp");
				out.println("</body></html>");
			}catch(IOException exp) {}
		}

		java.util.Date date = new java.util.Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		df.format(date);
		
		String dateFormat=df.format(date);//转换成字符串后能插入数据库里里对应的datetime格式数据。

		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;

		try {
			String condition="INSERT INTO messageboard values"+"("+"'"+hidden+"','"+input+"','"+dateFormat+"'"+")";
			
			con=conn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);//声明sql语句对象，并使type取值。
			sql.executeUpdate(condition);
			response.setContentType("text/html;charset=UTF-8");
			try {
				PrintWriter out=response.getWriter();
				out.println("<html><body>");
				out.println("留言成功，2秒后返回");
				response.setHeader("refresh", "2;URL=Messageboard.jsp");
				out.println("</body></html>");
			}catch(IOException exp) {}
			//rs.first();//获取第一条数据的信息
			//rs.last();//获取最后一条数据的信息
			//rs.next();//获取下一条数据的信息
			//rs.getRow();//获取当前信息的行数
			
			//rs.last();//这里的作用是移到最后一行 
			//int rowNumber=rs.getRow();//能得到记录数
			
			con.close();//关闭连接
			}catch(SQLException e) {   
				System.out.println(e);
				/*fail(request,response,"添加失败:"+e.toString());*/
		}
		//response.sendRedirect("Messageboard.jsp");
		/*response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out=response.getWriter();
			out.println("<html><body>");
			out.println("已经留言成功，1秒后返回");
			response.setHeader("refresh", "1;URL=Messageboard.jsp");
			out.println("</body></html>");
		}catch(IOException exp) {}*/
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
				out.println("<a href=U-demand-upload.jsp>重新输入</a>");
				out.println("</body></html>");
			}catch(IOException exp) {}
			}
}

