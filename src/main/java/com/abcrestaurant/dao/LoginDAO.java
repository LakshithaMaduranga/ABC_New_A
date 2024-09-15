package com.abcrestaurant.dao;

import com.abcrestaurant.model.Login;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    // Authenticate user by directly comparing the username and password (no hashing)
    public boolean authenticateUser(Login login) throws ClassNotFoundException {
        boolean isAuthenticated = false;
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Set username and password to check against the database
            preparedStatement.setString(1, login.getUsername());
            preparedStatement.setString(2, login.getPassword()); // Direct comparison without hashing

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // If a record exists, the user is authenticated
                if (resultSet.next()) {
                    isAuthenticated = true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAuthenticated;
    }

    // Get the role of the user from the database
    public String getUserRole(String username) throws ClassNotFoundException {
        String role = null;
        String query = "SELECT role FROM Users WHERE username = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Set the username to retrieve the role
            preparedStatement.setString(1, username);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    role = resultSet.getString("role");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }
}
