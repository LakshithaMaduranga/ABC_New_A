package com.abcrestaurant.dao;

import com.abcrestaurant.model.Register;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDAO {

    // Method to insert a new user into the database
    public boolean registerUser(Register user) throws ClassNotFoundException {
        boolean status = false;
        String query = "INSERT INTO Users (username, password, email, contactInfo, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword()); // You should hash the password before storing it
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getContactInfo());
            preparedStatement.setString(5, user.getRole());

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                status = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Method to check if a username or email is already taken
    public boolean isUserExists(String username, String email) throws ClassNotFoundException {
        boolean exists = false;
        String query = "SELECT * FROM Users WHERE username = ? OR email = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    exists = true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }
}
