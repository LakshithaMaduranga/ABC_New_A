package com.abcrestaurant.dao;

import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateOrderStatusDAO {

    // Method to update order status in the database
    public boolean updateOrderStatus(int orderID, String status) throws ClassNotFoundException, SQLException {
        boolean rowUpdated = false;
        
        // SQL query to update order status
        String sql = "UPDATE Orders SET status = ? WHERE orderID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set the parameters for the prepared statement
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, orderID);

            // Execute the update query
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }

        return rowUpdated;
    }
}
