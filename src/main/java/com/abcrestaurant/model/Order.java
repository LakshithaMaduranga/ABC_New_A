package com.abcrestaurant.model;

import java.util.List;

public class Order {
    private int orderID;
    private String customerName;
    private String date;
    private String status;
    private double totalAmount;
    private List<OrderItem> items;

    public Order(int orderID, String customerName, String date, String status, double totalAmount) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.date = date;
        this.status = status;
        this.totalAmount = totalAmount;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
