package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.mysql.jdbc.*;
import com.mysql.jdbc.*;
import javabean.Person;

/**
 * Servlet implementation class Person
 */
@WebServlet("/Person")
public class HandlePerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandlePerson() {
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
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession(true);
		Person person = new Person();
		session.setAttribute("person",person);
		
		String mnum = request.getParameter("mnum");
		request.getSession().setAttribute("mnum",mnum);
		
		String mname = request.getParameter("mname");
		String msex = request.getParameter("msex");
		String midcard = request.getParameter("midcard");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String maddress = request.getParameter("maddress");
		String mbirthplace = request.getParameter("mbirthplace");
		String mnationality = request.getParameter("mnationality");
		String mbirthday = request.getParameter("mbirthday");
		String mrate = request.getParameter("mrate");
		
		session.setAttribute("mname", mname);
		session.setAttribute("msex", msex);
		session.setAttribute("midcard", midcard);
		session.setAttribute("mphone", mphone);
		session.setAttribute("memail", memail);
		session.setAttribute("maddress", maddress);
		session.setAttribute("mbirthplace", mbirthplace);
		session.setAttribute("mnationality", mnationality);
		session.setAttribute("mbirthday", mbirthday);
		session.setAttribute("mrate", mrate);
		
    	String url = "jdbc:mysql://127.0.0.1/hansome?"+"user=root&password=123456&characterEncoding=utf-8";
		Connection con = null;
		try {			
			con = (Connection) DriverManager.getConnection(url);
			String sql ="update merchant set Mname=?,Msex=?,Midcard=?,Mphone=?,"
					     + "Memail=?,Maddress=?,Mbirthplace=?,Mnationality=?"
					     + ",Mbirthday=?,Mrate=? where Mnum=20170103";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1,mname);
			ps.setString(2,msex);
			ps.setString(3,midcard);
			ps.setString(4,mphone);
			ps.setString(5,memail);
			ps.setString(6,maddress);
			ps.setString(7,mbirthplace);
			ps.setString(8,mnationality);
			ps.setString(9,mbirthday);
			ps.setString(10,mrate);
			ps.execute();
			
			boolean m = ps.execute();			
			if (m)
			{
				person.setMname(mname);
				person.setSex(msex);
				person.setMidcard(midcard);
				person.setMphone(mphone);
				person.setMemail(memail);
				person.setMaddress(maddress);
				person.setMbirthplace(mbirthplace);
				person.setMationality(mnationality);
				person.setMbirthday(mbirthday);
				person.setMrate(mrate);
			}
			
			ps.close();
		    con.close();
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("person.jsp");
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
