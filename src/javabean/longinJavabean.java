package javabean;

import com.sun.rowset.CachedRowSetImpl;

public class longinJavabean {
	//存储会话中产生的数据
	CachedRowSetImpl rowSet=null;//存储表中全部记录的行集对象,(存储logoutServlet传来的数据)这里只存了（统计账号相同人数是1还是0作为判断）
	//当登陆者是管理员时
	CachedRowSetImpl rowSetMerchant=null;//存储表中全部记录的行集对象,(存储MerchantMangementServlet传来的数据)
	CachedRowSetImpl rowSetProduct=null;//存储表中全部记录的行集对象,(存储ProductServlet传来的数据)
	CachedRowSetImpl rowSetUser=null;//存储表中全部记录的行集对象,(存储UserMangementServlet传来的数据)
	CachedRowSetImpl rowSetDemand=null;//存储表中全部记录的行集对象,(存储DemandMangementServlet传来的数据)
	CachedRowSetImpl rowSetAdministrator=null;//存储表中全部记录的行集对象,(存储传来管理员APersonalServlet的数据)
	
	//当登陆者是用户
	CachedRowSetImpl rowSetUUser=null;//存储存储传来用户的数据（UPersonalServlet）
	CachedRowSetImpl rowSetUDemand=null;//存储存储传来用户的数据（UDemandMangementServlet）
	CachedRowSetImpl rowSetUorder=null;//存储存储传来用户的数据（UorderMangementServlet）
	
	String logname="";
	int boo=0;/*快速判断是否登录成功不成功为2，成功为一*/
	String BackNews="请登录";/*文字返回信息*/
	String nametype="";/*登陆者类型*/

	public void setRowSet(CachedRowSetImpl set) {
		rowSet=set;
	}
	public CachedRowSetImpl getRowSet() {
		return rowSet;
	}
	public void setRowSetMerchant(CachedRowSetImpl set) {
		rowSetMerchant=set;
	}
	public CachedRowSetImpl getRowSetMerchant() {
		return rowSetMerchant;
	}
	public void setRowSetProduct(CachedRowSetImpl set) {
		rowSetProduct=set;
	}
	public CachedRowSetImpl getRowSetProduct() {
		return rowSetProduct;
	}
	public void setRowSetUser(CachedRowSetImpl set) {
		rowSetUser=set;
	}
	public CachedRowSetImpl getRowSetUser() {
		return rowSetUser;
	}
	public void setRowSetDemand(CachedRowSetImpl set) {
		rowSetDemand=set;
	}
	public CachedRowSetImpl getRowSetDemand() {
		return rowSetDemand;
	}
	public void setRowAdministrator(CachedRowSetImpl set) {
		rowSetAdministrator=set;
	}
	public CachedRowSetImpl getRowAdministrator() {
		return rowSetAdministrator;
	}
	public void setRowSetUDemand(CachedRowSetImpl set) {
		rowSetUDemand=set;
	}
	public CachedRowSetImpl getRowSetUDemand() {
		return rowSetUDemand;
	}
	public void setRowSetUorder(CachedRowSetImpl set) {
		rowSetUorder=set;
	}
	public CachedRowSetImpl getRowSetUorder() {
		return rowSetUorder;
	}
	public void setRowSetUUser(CachedRowSetImpl set) {
		rowSetUUser=set;
	}
	public CachedRowSetImpl getRowSetUUser() {
		return rowSetUUser;
	}
	public void setlogname(String l) {
		logname=l;
	}
	public String getlogname() {
		return logname;
	}
	public void setboo(int b) {
		boo=b;
	}
	public int getboo() {
		return boo;
	}
	public void setBackNews(String b) {
		BackNews=b;
	}
	public String getBackNews() {
		return BackNews;
	}
	public void setnametype(String n) {
		nametype=n;
	}
	public String getnametype() {
		return nametype;
	}
}
