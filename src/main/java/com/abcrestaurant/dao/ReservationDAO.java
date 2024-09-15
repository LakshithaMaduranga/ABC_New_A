package com.abcrestaurant.dao;

import com.abcrestaurant.model.Reservation;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    // Method to cancel a reservation
    public boolean cancelReservation(int reservationID) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM Reservations WHERE reservationID = ?"; // Assuming reservations are deleted to cancel them

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, reservationID);
            rowDeleted = statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }

    // Method to add a new reservation
    public void addReservation(Reservation reservation) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Reservations (customerName, date, time, status) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, reservation.getCustomerName());
            statement.setDate(2, java.sql.Date.valueOf(reservation.getDate()));
            statement.setTime(3, java.sql.Time.valueOf(reservation.getTime()));
            statement.setString(4, reservation.getStatus());
            statement.executeUpdate();
        }
    }

    // Method to retrieve all reservations
    public List<Reservation> getAllReservations() throws SQLException, ClassNotFoundException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM Reservations";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("reservationID");
                String customerName = resultSet.getString("customerName");
                LocalDate date = resultSet.getDate("date").toLocalDate();
                LocalTime time = resultSet.getTime("time").toLocalTime();
                String status = resultSet.getString("status");

                reservations.add(new Reservation(id, customerName, date, time, status));
            }
        }
        return reservations;
    }

    // Method to retrieve a reservation by ID
    public Reservation getReservationById(int reservationID) throws SQLException, ClassNotFoundException {
        Reservation reservation = null;
        String sql = "SELECT * FROM Reservations WHERE reservationID = ?";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, reservationID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String customerName = resultSet.getString("customerName");
                    LocalDate date = resultSet.getDate("date").toLocalDate();
                    LocalTime time = resultSet.getTime("time").toLocalTime();
                    String status = resultSet.getString("status");

                    reservation = new Reservation(reservationID, customerName, date, time, status);
                }
            }
        }
        return reservation;
    }

    // Method to update a reservation
    public void updateReservation(Reservation reservation) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Reservations SET customerName = ?, date = ?, time = ?, status = ? WHERE reservationID = ?";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, reservation.getCustomerName());
            statement.setDate(2, java.sql.Date.valueOf(reservation.getDate()));
            statement.setTime(3, java.sql.Time.valueOf(reservation.getTime()));
            statement.setString(4, reservation.getStatus());
            statement.setInt(5, reservation.getReservationID());
            statement.executeUpdate();
        }
    }

    // Method to delete a reservation
    public void deleteReservation(int reservationID) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Reservations WHERE reservationID = ?";
        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, reservationID);
            statement.executeUpdate();
        }
    }
}
