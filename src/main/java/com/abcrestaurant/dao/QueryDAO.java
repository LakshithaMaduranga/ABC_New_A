package com.abcrestaurant.dao;

import com.abcrestaurant.model.Query;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QueryDAO {

    public boolean addQuery(Query query) {
        boolean rowInserted = false;
        String sql = "INSERT INTO Queries (customerName, email, subject, message, status) VALUES (?, ?, ?, ?, 'Pending')";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, query.getCustomerName());
            statement.setString(2, query.getEmail());
            statement.setString(3, query.getSubject());
            statement.setString(4, query.getMessage());

            rowInserted = statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowInserted;
    }

    public List<Query> getAllQueries() {
        List<Query> queries = new ArrayList<>();
        String sql = "SELECT * FROM Queries";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Query query = new Query();
                query.setQueryID(resultSet.getInt("queryID"));
                query.setCustomerName(resultSet.getString("customerName"));
                query.setEmail(resultSet.getString("email"));
                query.setSubject(resultSet.getString("subject"));
                query.setMessage(resultSet.getString("message"));
                query.setStatus(resultSet.getString("status"));

                queries.add(query);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return queries;
    }

    public Query getQueryById(int queryID) {
        Query query = null;
        String sql = "SELECT * FROM Queries WHERE queryID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, queryID);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                query = new Query();
                query.setQueryID(resultSet.getInt("queryID"));
                query.setCustomerName(resultSet.getString("customerName"));
                query.setEmail(resultSet.getString("email"));
                query.setSubject(resultSet.getString("subject"));
                query.setMessage(resultSet.getString("message"));
                query.setStatus(resultSet.getString("status"));
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return query;
    }

    public boolean deleteQuery(int queryID) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM Queries WHERE queryID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, queryID);

            rowDeleted = statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
}
