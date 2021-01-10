package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class Conn {
	// MySQL 8.0 以下版本 - JDBC 驱动名及数据库 URL
	//final String MYSQLDBDRIVER = "com.mysql.jdbc.Driver";//8.0以上都mysql不适用
	//final String MYSQLDBURL = "jdbc:mysql://localhost/hansome";
	// MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
	final String MYSQLDBDRIVER = "com.mysql.cj.jdbc.Driver";//8.0以上都可用
	final String MYSQLDBURL = "jdbc:mysql://localhost:3306/hansome?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	//数据库账户密码
	final String MYSQLDBUSER = "root";
	final String MYSQLDBUSERPASS = "password";

	public Connection getConnection() {
		try {
			Class.forName(MYSQLDBDRIVER);
			Connection con = DriverManager.getConnection(MYSQLDBURL,
					MYSQLDBUSER, MYSQLDBUSERPASS);
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}