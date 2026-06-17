package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBConnect {
	private static Connection c;
//
//	public static Connection getConn() {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagementSystem", "root", "mysql");
////			Statement st = c.createStatement();
////			st.executeUpdate("");
////			c.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return c;
//	}
//}

	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagementSystem", "root", "mysql");

//			System.out.println("DATABASE CONNECTED SUCCESSFULLY");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}
}