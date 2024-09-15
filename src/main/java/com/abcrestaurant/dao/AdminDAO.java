package com.abcrestaurant.dao;

import com.abcrestaurant.model.Admin;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // Retrieve admin by username and password (used for login)
    public Admin authenticateAdmin(String username, String password) throws SQLException, ClassNotFoundException {
        Admin admin = null;
        String query = "SELECT * FROM Users WHERE username = ? AND password = ? AND role = 'Admin'";
        
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                admin = new Admin(
                        resultSet.getInt("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("contactInfo"),
                        resultSet.getString("role")
                );
            }
        }
        return admin;
    }

    // Method to retrieve all admins
    public List<Admin> getAllAdmins() throws SQLException, ClassNotFoundException {
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT * FROM Users WHERE role = 'Admin'";
        
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                Admin admin = new Admin(
                        resultSet.getInt("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("contactInfo"),
                        resultSet.getString("role")
                );
                admins.add(admin);
            }
        }
        return admins;
    }

    // Update admin details
    public void updateAdmin(Admin admin) throws SQLException, ClassNotFoundException {
        String query = "UPDATE Users SET username = ?, password = ?, email = ?, contactInfo = ? WHERE userID = ?";
        
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setString(1, admin.getUsername());
            statement.setString(2, admin.getPassword());
            statement.setString(3, admin.getEmail());
            statement.setString(4, admin.getContactInfo());
            statement.setInt(5, admin.getUserID());
            
            statement.executeUpdate();
        }
    }

    // Delete admin by ID
    public void deleteAdmin(int userID) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM Users WHERE userID = ?";
        
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setInt(1, userID);
            statement.executeUpdate();
        }
    }
}
