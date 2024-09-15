package com.abcrestaurant.dao;

import com.abcrestaurant.model.ManageUser;
import com.abcrestaurant.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManageUserDAO {

    // Method to retrieve all users
    public List<ManageUser> getAllUsers() throws ClassNotFoundException {
        List<ManageUser> users = new ArrayList<>();
        String query = "SELECT * FROM Users";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                ManageUser user = new ManageUser();
                user.setUserID(resultSet.getInt("userID"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                user.setPassword(resultSet.getString("password"));
                user.setContactInfo(resultSet.getString("contactInfo"));  // Added contactInfo

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Method to retrieve a user by ID
    public ManageUser getUserByID(int userID) throws ClassNotFoundException {
        ManageUser user = null;
        String query = "SELECT * FROM Users WHERE userID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new ManageUser();
                user.setUserID(resultSet.getInt("userID"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                user.setPassword(resultSet.getString("password"));
                user.setContactInfo(resultSet.getString("contactInfo"));  // Added contactInfo
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Method to add a new user
    public boolean addUser(ManageUser user) throws ClassNotFoundException {
        String query = "INSERT INTO Users (username, password, email, role, contactInfo) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getRole());
            statement.setString(5, user.getContactInfo());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Method to update a user
    public boolean updateUser(ManageUser user) throws ClassNotFoundException {
        String query = "UPDATE Users SET username = ?, password = ?, email = ?, role = ?, contactInfo = ? WHERE userID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getRole());
            statement.setString(5, user.getContactInfo());
            statement.setInt(6, user.getUserID());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Method to delete a user
    public boolean deleteUser(int userID) throws ClassNotFoundException {
        String query = "DELETE FROM Users WHERE userID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, userID);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
