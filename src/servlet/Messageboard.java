package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sun.rowset.CachedRowSetImpl;

import javabean.Conn;
import javabean.MessageBoardData;

/**
 * Servlet implementation class Messageboard
 */
@WebServlet("/Messageboard")
public class Messageboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CachedRowSetImpl rowSet=null;//CachedRowSetImpl对象
	Conn conn = new Conn();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Messageboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at(get): ").append(request.getContextPath());
		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;
		MessageBoardData dataBean=null;

		//HttpSession session=request.getSession(true);//创造一个新session，我们确认session一定存在或者sesson不存在时明确有创建session的需要才用，否则尽量使用request.getSession(false)。
		ServletContext application = null;//创造一个新application，作为留言板是全局共享的
		application = request.getSession().getServletContext();
		/*创建javaBean对象*/
		try {
			//dataBean= (MessageBoardData)session.getAttribute("dataBean");
			dataBean=(MessageBoardData) application.getAttribute("MessageBoardData");
			if(dataBean==null) {
				dataBean=new MessageBoardData();
				//session.setAttribute("dataBean", dataBean);	
				application.setAttribute("MessageBoardData", dataBean);
			}
		}catch(Exception e) {
			dataBean=new MessageBoardData();
			//session.setAttribute("dataBean", dataBean);	
			application.setAttribute("MessageBoardData", dataBean);
		}
		try {
			con = conn.getConnection();//获取Conn类的函数返回已经初始化好的的Connection对象
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);//声明sql语句对象，并使type取值。
			rs=sql.executeQuery("Select * from messageboard");//留言相关信息存在messageboard表中//不要大写，默认都小写
			rowSet=new CachedRowSetImpl();//创造行集对象
			rowSet.populate(rs);
			dataBean.setRowSet(rowSet);//行集数据存储到dataBean
			con.close();//关闭连接
			}catch(SQLException e) {
		}
		response.sendRedirect("Messageboard.jsp");
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Message-board.jsp");
		//重定向和跳转
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
	}

}
