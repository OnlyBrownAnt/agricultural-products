package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.concurrent.CountDownLatch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.*;
import com.mysql.jdbc.*;
import javabean.Register;
/**
 * Servlet implementation class Register
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){}
	}
    public String handleString(String s) {
    	try {
    		byte bb[] = s.getBytes("utf-8");
    		s = new String(bb);
    	}
		catch(Exception ee) {}
    	return s;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 
    	String url = "jdbc:mysql://127.0.0.1/hansome?"+"user=root&password=123456&characterEncoding=utf-8";
		Connection con;
		PreparedStatement sql;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		Register userBean = new Register();
		request.setAttribute("userBean", userBean);
		String mnum = request.getParameter("mnum");
		String mpassword = request.getParameter("mpassword");		
		String mname = "";
		String msex = "";
		String midcard = "";
		String mphone = "";
		String memail = "";
		String maddress = "";
		String mrate = "";
		if (mnum == null) {
			mnum = "";
		}
		if (mpassword == null) {
			mpassword = "";
		}
		
		boolean boo = mnum.length()>0 && mpassword.length()>0;
		try {
			con = (Connection) DriverManager.getConnection(url);
			String insertCondition = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?)";              //插入表
			sql = (PreparedStatement) con.prepareStatement(insertCondition);
			if (boo) {
				sql.setString(1, handleString(mnum));
				sql.setString(2, handleString(mpassword));
				sql.setString(3, handleString(mname));	
				sql.setString(4, handleString(msex));
				sql.setString(5, handleString(midcard));
				sql.setString(6, handleString(mphone));
				sql.setString(7, handleString(memail));
				sql.setString(8, handleString(maddress));
				sql.setString(9, handleString(mrate));
		
			}
			int m = sql.executeUpdate();                                            //返回受到影响的行数
			if (m != 0) {
				String backnews = "注册成功";
				userBean.setBacknews(backnews);
				userBean.setMnum(mnum);
				userBean.setMpassword(mpassword);
			}
			
		}
		catch(SQLException exp) {}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("longin.jsp");
		dispatcher.forward(request, response);
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
