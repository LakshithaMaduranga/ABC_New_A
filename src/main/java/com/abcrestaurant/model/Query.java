package com.abcrestaurant.model;

public class Query {
    private int queryID;
    private String customerName;
    private String email;
    private String subject;
    private String message;
    private String status;

    // Constructor for adding a new query
    public Query(String customerName, String email, String subject, String message) {
        this.customerName = customerName;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.status = "Pending";
    }

    public Query() {}

    // Getters and Setters
    public int getQueryID() {
        return queryID;
    }

    public void setQueryID(int queryID) {
        this.queryID = queryID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
