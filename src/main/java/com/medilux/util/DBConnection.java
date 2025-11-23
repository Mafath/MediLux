package com.medilux.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static String url = "jdbc:mysql://localhost:3306/medilux";
	private static String user = "YOUR_DB_USERNAME";
	private static String pass = "YOUR_DB_PASSWORD";
	private static Connection con;
	
	//To check if database connection is successful or not
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);

		}
		catch(Exception e) {
			System.out.println("Database Not Connected");
		}
		return con;
	}

}
