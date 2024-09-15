package com.abcrestaurant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.abcrestaurant.model.Query;
import com.abcrestaurant.util.DBConnection;

public class RespondToQueriesDAO {

    // Method to send a response to a query
    public boolean respondToQuery(int queryID, String responseMessage) throws ClassNotFoundException {
        String sql = "UPDATE queries SET responseMessage = ?, status = 'Responded' WHERE queryID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            // Set the response message and query ID
            statement.setString(1, responseMessage);
            statement.setInt(2, queryID);

            // Execute the update
            int rowsUpdated = statement.executeUpdate();

            // Return true if the update was successful
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get a specific query by query ID
    public Query getQueryById(int queryID) throws ClassNotFoundException {
        String sql = "SELECT * FROM queries WHERE queryID = ?";
        Query query = null;

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, queryID);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    query = new Query();
                    query.setQueryID(resultSet.getInt("queryID"));
                    query.setCustomerName(resultSet.getString("customerName"));
                    query.setEmail(resultSet.getString("email"));
                    query.setSubject(resultSet.getString("subject"));
                    query.setMessage(resultSet.getString("message"));
                    query.setResponseMessage(resultSet.getString("responseMessage"));
                    query.setStatus(resultSet.getString("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return query;
    }
}
