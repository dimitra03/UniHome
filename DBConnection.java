package unihome;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Handles database connection management for the application.
 * This class provides methods to establish and close a connection to the database.
 * 
 * <p>It uses the MySQL JDBC driver to connect to a specified database.</p>
 * 
 * <p><strong>Note:</strong> Ensure the MySQL JDBC driver is added to the classpath for this class to function correctly.</p>
 * 
 * @author Dimitra Telatinidou
 * @version 1.0
 */

public class DBConnection {
	
	private static Connection conn;
	
	public static Connection openConnection() throws SQLException  {
	
        // Database credentials
        String url = "jdbc:mysql://195.251.249.131/ismgroup12?serverTimezone=UTC&useSSL=false"; 
        String username = "ismgroup12"; // MySQL username
        String password = "s82rw9"; // MySQL password

		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		conn =  DriverManager.getConnection(url, username, password);
		
		return conn;
	}
	
	public static void closeConnection() throws SQLException {
		
		try {
			if (conn != null) conn.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
