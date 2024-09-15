package com.abcrestaurant.dao;

import com.abcrestaurant.model.Customer;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    // Method to add a new customer to the database
    public void addCustomer(Customer customer) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO Users (username, password, email, contactInfo, role, address, phoneNumber) VALUES (?, ?, ?, ?, 'Customer', ?, ?)";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getContactInfo());
            statement.setString(5, customer.getAddress());
            statement.setString(6, customer.getPhoneNumber());

            statement.executeUpdate();
        }
    }

    // Method to get a customer by their ID
    public Customer getCustomerByID(int customerID) throws SQLException, ClassNotFoundException {
        Customer customer = null;
        String query = "SELECT * FROM Users WHERE userID = ? AND role = 'Customer'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, customerID);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                customer = new Customer(
                        resultSet.getInt("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("contactInfo"),
                        resultSet.getString("role"),
                        resultSet.getInt("userID"),
                        resultSet.getString("address"),
                        resultSet.getString("phoneNumber")
                );
            }
        }
        return customer;
    }

    // Method to update an existing customer in the database
    public void updateCustomer(Customer customer) throws SQLException, ClassNotFoundException {
        String query = "UPDATE Users SET username = ?, password = ?, email = ?, contactInfo = ?, address = ?, phoneNumber = ? WHERE userID = ? AND role = 'Customer'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getContactInfo());
            statement.setString(5, customer.getAddress());
            statement.setString(6, customer.getPhoneNumber());
            statement.setInt(7, customer.getCustomerID());

            statement.executeUpdate();
        }
    }

    // Method to delete a customer by their ID
    public void deleteCustomer(int customerID) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM Users WHERE userID = ? AND role = 'Customer'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, customerID);
            statement.executeUpdate();
        }
    }

    // Method to retrieve a list of all customers
    public List<Customer> getAllCustomers() throws SQLException, ClassNotFoundException {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM Users WHERE role = 'Customer'";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Customer customer = new Customer(
                        resultSet.getInt("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("contactInfo"),
                        resultSet.getString("role"),
                        resultSet.getInt("userID"),
                        resultSet.getString("address"),
                        resultSet.getString("phoneNumber")
                );
                customers.add(customer);
            }
        }
        return customers;
    }
}
