package com.abcrestaurant.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        // MySQL JDBC Driver
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        // MySQL connection URL
        String dbURL = "jdbc:mysql://localhost:3306/";
        // Database name
        String dbName = "restaurant_db2";
        // Database credentials
        String dbUsername = "root"; 
        String dbPassword = "GAmit54@23L78"; 

        // Load the MySQL JDBC driver
        Class.forName(dbDriver);
        // Establish the connection
        Connection conn = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
        return conn;
        
        
        
    }
}
