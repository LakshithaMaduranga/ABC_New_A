package com.abcrestaurant.dao;

import com.abcrestaurant.model.Staff;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    // Method to add a new staff member to the database
    public void addStaff(Staff staff) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO Users (username, password, email, contactInfo, role, position, shift) VALUES (?, ?, ?, ?, 'Staff', ?, ?)";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, staff.getUsername());
            statement.setString(2, staff.getPassword());
            statement.setString(3, staff.getEmail());
            statement.setString(4, staff.getContactInfo());
            statement.setString(5, staff.getPosition());
            statement.setString(6, staff.getShift());

            statement.executeUpdate();
        }
    }

    // Method to get a staff member by their ID
    public Staff getStaffByID(int staffID) throws SQLException, ClassNotFoundException {
        Staff staff = null;
        String query = "SELECT * FROM Users WHERE userID = ? AND role = 'Staff'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, staffID);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                staff = new Staff(
                        resultSet.getInt("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("contactInfo"),
                        resultSet.getString("role"),
                        resultSet.getInt("userID"),
                        resultSet.getString("position"),
                        resultSet.getString("shift")
                );
            }
        }
        return staff;
    }

    // Method to update an existing staff member
    public void updateStaff(Staff staff) throws SQLException, ClassNotFoundException {
        String query = "UPDATE Users SET username = ?, password = ?, email = ?, contactInfo = ?, position = ?, shift = ? WHERE userID = ? AND role = 'Staff'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, staff.getUsername());
            statement.setString(2, staff.getPassword());
            statement.setString(3, staff.getEmail());
            statement.setString(4, staff.getContactInfo());
            statement.setString(5, staff.getPosition());
            statement.setString(6, staff.getShift());
            statement.setInt(7, staff.getStaffID());

            statement.executeUpdate();
        }
    }

    // Method to delete a staff member
    public void deleteStaff(int staffID) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM Users WHERE userID = ? AND role = 'Staff'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, staffID);
            statement.executeUpdate();
        }
    }

    // Method to retrieve all staff members
    public List<Staff> getAllStaff() throws SQLException, ClassNotFoundException {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM Users WHERE role = 'Staff'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Staff staff = new Staff(
                        resultSet.getInt("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("contactInfo"),
                        resultSet.getString("role"),
                        resultSet.getInt("userID"),
                        resultSet.getString("position"),
                        resultSet.getString("shift")
                );
                staffList.add(staff);
            }
        }
        return staffList;
    }
}
