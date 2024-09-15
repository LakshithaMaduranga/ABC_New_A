package com.abcrestaurant.model;

import java.util.Date;

public class ManageOrders {
    private int orderID;
    private String customerName;
    private Date date;
    private String status;

    // Constructors
    public ManageOrders() {}

    public ManageOrders(int orderID, String customerName, Date date, String status) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
