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
import javabean.MessageBoardData;
import javabean.longinJavabean;

/**
 * Servlet implementation class longinServlet
 */
@WebServlet("/longinServlet")
public class longinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CachedRowSetImpl rowSet=null;//CachedRowSetImpl对象//这里暂时没起什么用
	Conn conn = new Conn();
	/**
     * @see HttpServlet#HttpServlet()
     */
    public longinServlet() {
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
		//获取表单提交的账号密码
		request.setCharacterEncoding("gb2312");//获取时的编码
		String logname=request.getParameter("logname");
		String password=request.getParameter("password");
		String nametype=request.getParameter("option");
		int boo=0;
		
		//建立必要的对象
		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;
		String condition="";//取人数判断
		longinJavabean dataBean=null;
		
		HttpSession session=request.getSession(true);//创建session对象
		/*创建javaBean对象 并存至session*//*对于session一般更创建一次就好*/
		try {
			//dataBean= (MessageBoardData)session.getAttribute("dataBean");
			dataBean=(longinJavabean) session.getAttribute("dataBeanlongin");
			//dataBean=(longinJavabean) request.getAttribute("dataBean");
			if(dataBean==null) {
				dataBean=new longinJavabean();
				session.setAttribute("dataBeanlongin", dataBean);	
				//request.setAttribute("dataBean", dataBean);
			}
		}catch(Exception e) {
			dataBean=new longinJavabean();
			session.setAttribute("dataBeanlongin", dataBean);	
			//request.setAttribute("dataBean", dataBean);
		}		
		
		/*设计sql语句*//*已知账号密码，查询匹配人数*/
		String Administrator="Administrator";
		String User="User";
		String Merchant="Merchant";		
		boolean	one=nametype.equals(Administrator);//字符串匹配
		boolean two=nametype.equals(User);
		boolean	three=nametype.equals(Merchant);
		if(one) 
		{
			condition="select count(*) from administrator where Anum='"+logname+"' and Apassword='"+password+"'";
		}
		if(two) 
		{
			condition="select count(*) from user where Unum='"+logname+"' and Upassword='"+password+"'";
		}
		if(three) 
		{
			condition="select count(*) from merchant where Mnum='"+logname+"' and Mpassword='"+password+"'";
		}
		
		try {
			con=conn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);//声明sql语句对象，并使type取值。
			rs=sql.executeQuery(condition);
			
			dataBean.setboo(boo);//设初值
			rs.beforeFirst();
			
			while(rs.next()) {
				boo=boo+rs.getInt(1);//是无法从结果集中得到值的（改：是可以的,getInt既可以取出数值），只能另辟技巧，滚动结果集，有大于等于一行，boo就大于0不知道为什么，滚动时想增长也是无效的，还不如直接在滚动时取
			}
			if(boo==1) {//登录成功才会对dataBean的一些属性赋值
				dataBean.setlogname(logname);
				dataBean.setnametype(nametype);
				dataBean.setBackNews("已经登录成功");
			}else {boo=2;}
			System.out.println(boo);
			dataBean.setboo(boo);//回执
			System.out.println((String)rs.getString(1));
			//dataBean.setboo(rs.getString(1));//因为是人数，就只有一列
			//System.out.println(dataBean.getboo());
			rowSet=new CachedRowSetImpl();//创造行集对象/*这里本来也是像用于做个判断，但另外设立boolean值boo，现在暂时不用这个了*/
			rowSet.populate(rs);
			dataBean.setRowSet(rowSet);//行集数据存储到dataBean
			con.close();//关闭连接
			}catch(SQLException e) {}
		
		response.sendRedirect("longin.jsp");
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Message-board.jsp");
		//重定向和跳转
	}
}
