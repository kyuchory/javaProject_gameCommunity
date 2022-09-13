package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	// JDBC driver name and database URL
	
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // deprecated "com.mysql.jdbc.Driver";  // try "com.mysql.cj.jdbc.Driver"
	private static final String DB_URL = "jdbc:mysql://192.168.1.101:3306/spring5fs?allowPublicKeyRetriebal=true&useSSl=false&serverTimezone=Asia/Seoul";

	//  Database credentials
	private static final String USER = "root";
	private static final String PASS = "Test123!@#";
	
	
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(JDBC_DRIVER); //STEP 2: Register JDBC driver
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} 
		return DriverManager.getConnection(DB_URL,USER,PASS); //STEP 3: Open a connection
	}
}
