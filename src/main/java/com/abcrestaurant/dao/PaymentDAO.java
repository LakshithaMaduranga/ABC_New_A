package com.abcrestaurant.dao;

import com.abcrestaurant.model.Payment;
import com.abcrestaurant.util.DBConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {

    // Method to add a new payment
    public boolean addPayment(Payment payment) {
        boolean rowInserted = false;
        String sql = "INSERT INTO Payments (reservationID, paymentMethod, amount, paymentDate) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, payment.getReservationID());
            statement.setString(2, payment.getPaymentMethod());
            statement.setBigDecimal(3, BigDecimal.valueOf(payment.getAmount())); // Convert double to BigDecimal
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(payment.getPaymentDate()));

            rowInserted = statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowInserted;
    }

    // Method to delete a payment by ID
    public boolean deletePayment(int paymentID) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM Payments WHERE paymentID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, paymentID);

            rowDeleted = statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }

    // Method to retrieve a payment by ID
    public Payment getPaymentById(int paymentID) {
        Payment payment = null;
        String sql = "SELECT * FROM Payments WHERE paymentID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, paymentID);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                payment = new Payment();
                payment.setPaymentID(resultSet.getInt("paymentID"));
                payment.setReservationID(resultSet.getInt("reservationID"));
                payment.setPaymentMethod(resultSet.getString("paymentMethod"));
                payment.setAmount(resultSet.getBigDecimal("amount").doubleValue()); // Convert BigDecimal to double
                payment.setPaymentDate(resultSet.getTimestamp("paymentDate").toLocalDateTime());
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return payment;
    }

    // Method to update a payment
    public boolean updatePayment(Payment payment) {
        boolean rowUpdated = false;
        String sql = "UPDATE Payments SET reservationID = ?, paymentMethod = ?, amount = ?, paymentDate = ? WHERE paymentID = ?";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, payment.getReservationID());
            statement.setString(2, payment.getPaymentMethod());
            statement.setBigDecimal(3, BigDecimal.valueOf(payment.getAmount())); // Convert double to BigDecimal
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(payment.getPaymentDate()));
            statement.setInt(5, payment.getPaymentID());

            rowUpdated = statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }

    // Method to retrieve all payments
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM Payments";

        try (Connection connection = DBConnection.initializeDatabase();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Payment payment = new Payment();
                payment.setPaymentID(resultSet.getInt("paymentID"));
                payment.setReservationID(resultSet.getInt("reservationID"));
                payment.setPaymentMethod(resultSet.getString("paymentMethod"));
                payment.setAmount(resultSet.getBigDecimal("amount").doubleValue()); // Convert BigDecimal to double
                payment.setPaymentDate(resultSet.getTimestamp("paymentDate").toLocalDateTime());

                payments.add(payment);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return payments;
    }
}
