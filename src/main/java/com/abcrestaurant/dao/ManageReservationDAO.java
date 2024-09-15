package com.abcrestaurant.dao;

import com.abcrestaurant.model.ManageReservation;
import com.abcrestaurant.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManageReservationDAO {

    public List<ManageReservation> getAllReservations() throws SQLException {
        List<ManageReservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM reservations";
        
        try (Connection connection = DBConnection.initializeDatabase();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                String reservationID = resultSet.getString("reservationID");
                String customerName = resultSet.getString("customerName");
                String date = resultSet.getString("date");
                String time = resultSet.getString("time");
                String status = resultSet.getString("status");

                ManageReservation reservation = new ManageReservation(reservationID, customerName, date, time, status);
                reservations.add(reservation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservations;
    }

    public boolean updateReservationStatus(String reservationID, String status) throws SQLException, ClassNotFoundException {
        String query = "UPDATE reservations SET status = ? WHERE reservationID = ?";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, status);
            statement.setString(2, reservationID);
            return statement.executeUpdate() > 0;
        }
    }

    public boolean cancelReservation(String reservationID) throws SQLException, ClassNotFoundException {
        String query = "UPDATE reservations SET status = 'Cancelled' WHERE reservationID = ?";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, reservationID);
            return statement.executeUpdate() > 0;
        }
    }
}
