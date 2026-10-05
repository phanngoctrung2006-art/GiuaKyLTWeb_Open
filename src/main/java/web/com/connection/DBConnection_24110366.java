package web.com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection_24110366 {
	public static String dbUrl = "jdbc:mysql://localhost:3306/KtGiuaKi";
	public static String dbUser = "root";
	public static String dbPassword = "123456";
	public static String dbDriver = "com.mysql.cj.jdbc.Driver";
	public static String dbClass = "com.mysql.cj.jdbc.Driver";
	public static Connection getConnection() throws Exception {
		Connection con = null;
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}

