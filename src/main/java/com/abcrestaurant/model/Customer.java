package com.abcrestaurant.model;

public class Customer extends User {
    
    private int customerID;
    private String address;
    private String phoneNumber;

    // Default constructor
    public Customer() {
        super();
    }

    // Constructor to initialize Customer attributes
    public Customer(int userID, String username, String password, String email, String contactInfo, String role, 
                    int customerID, String address, String phoneNumber) {
        super(userID, username, password, email, contactInfo, role);
        this.customerID = customerID;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    // Getters and setters
    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // Additional methods specific to customer
    public void makeReservation() {
        // Logic for making a reservation
        System.out.println("Customer is making a reservation.");
    }

    public void placeOrder() {
        // Logic for placing an order
        System.out.println("Customer is placing an order.");
    }

    public void submitQuery() {
        // Logic for submitting a query
        System.out.println("Customer is submitting a query.");
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerID=" + customerID +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", username='" + getUsername() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", contactInfo='" + getContactInfo() + '\'' +
                ", role='" + getRole() + '\'' +
                '}';
    }
}
