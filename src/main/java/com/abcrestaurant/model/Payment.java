package com.abcrestaurant.model;

import java.time.LocalDateTime;

public class Payment {
    private int paymentID;
    private int reservationID;
    private String paymentMethod;
    private double amount;
    private LocalDateTime paymentDate;

    // Default constructor
    public Payment() {
    }

    // Parameterized constructor with paymentID (for existing payments)
    public Payment(int paymentID, int reservationID, String paymentMethod, double amount, LocalDateTime paymentDate) {
        this.paymentID = paymentID;
        this.reservationID = reservationID;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.paymentDate = paymentDate;
    }

    // Parameterized constructor without paymentID (for new payments)
    public Payment(int reservationID, String paymentMethod, double amount, LocalDateTime paymentDate) {
        this.reservationID = reservationID;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.paymentDate = paymentDate;
    }

    // Getters and Setters
    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }
}
