package com.abcrestaurant.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Reservation {
    private int reservationID;
    private int userID;  // Add this field to store the user ID
    private String customerName;
    private LocalDate date;
    private LocalTime time;
    private String status;

    // Default constructor
    public Reservation() {
    }

    // Constructor to initialize all fields
    public Reservation(int userID, String customerName, LocalDate date, LocalTime time, String status) {
        this.userID = userID;
        this.customerName = customerName;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    // Constructor to initialize without userID (assuming it's set later)
    public Reservation(String customerName, LocalDate date, LocalTime time, String status) {
        this.customerName = customerName;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    // Getters and Setters
    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public int getUserID() {  // Getter for userID
        return userID;
    }

    public void setUserID(int userID) {  // Setter for userID
        this.userID = userID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "reservationID=" + reservationID +
                ", userID=" + userID +
                ", customerName='" + customerName + '\'' +
                ", date=" + date +
                ", time=" + time +
                ", status='" + status + '\'' +
                '}';
    }
}
