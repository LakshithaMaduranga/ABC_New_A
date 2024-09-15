package com.abcrestaurant.model;

public class StaffDashboard {
    private int reservationCount;
    private int queryCount;
    private int orderCount;

    // Constructor
    public StaffDashboard(int reservationCount, int queryCount, int orderCount) {
        this.reservationCount = reservationCount;
        this.queryCount = queryCount;
        this.orderCount = orderCount;
    }

    // Getters and Setters
    public int getReservationCount() {
        return reservationCount;
    }

    public void setReservationCount(int reservationCount) {
        this.reservationCount = reservationCount;
    }

    public int getQueryCount() {
        return queryCount;
    }

    public void setQueryCount(int queryCount) {
        this.queryCount = queryCount;
    }

    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }
}
