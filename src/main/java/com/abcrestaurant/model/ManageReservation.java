package com.abcrestaurant.model;

public class ManageReservation {
    private String reservationID;
    private String customerName;
    private String date;
    private String time;
    private String status;

    // Constructor
    public ManageReservation(String reservationID, String customerName, String date, String time, String status) {
        this.reservationID = reservationID;
        this.customerName = customerName;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    // Getters and Setters
    public String getReservationID() {
        return reservationID;
    }

    public void setReservationID(String reservationID) {
        this.reservationID = reservationID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
