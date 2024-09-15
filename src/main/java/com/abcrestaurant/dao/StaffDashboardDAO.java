package com.abcrestaurant.dao;

import com.abcrestaurant.model.StaffDashboard;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaffDashboardDAO {

    public StaffDashboard getDashboardStats() throws SQLException, ClassNotFoundException {
        int reservationCount = 0;
        int queryCount = 0;
        int orderCount = 0;

        String reservationQuery = "SELECT COUNT(*) FROM reservations";
        String queryQuery = "SELECT COUNT(*) FROM queries";
        String orderQuery = "SELECT COUNT(*) FROM orders";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement reservationStatement = connection.prepareStatement(reservationQuery);
             PreparedStatement queryStatement = connection.prepareStatement(queryQuery);
             PreparedStatement orderStatement = connection.prepareStatement(orderQuery)) {

            // Get reservation count
            ResultSet rsReservation = reservationStatement.executeQuery();
            if (rsReservation.next()) {
                reservationCount = rsReservation.getInt(1);
            }

            // Get query count
            ResultSet rsQuery = queryStatement.executeQuery();
            if (rsQuery.next()) {
                queryCount = rsQuery.getInt(1);
            }

            // Get order count
            ResultSet rsOrder = orderStatement.executeQuery();
            if (rsOrder.next()) {
                orderCount = rsOrder.getInt(1);
            }

            return new StaffDashboard(reservationCount, queryCount, orderCount);
        }
    }
}
