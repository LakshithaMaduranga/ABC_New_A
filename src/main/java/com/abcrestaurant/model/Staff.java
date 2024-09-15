package com.abcrestaurant.model;

public class Staff extends User {

    private int staffID;
    private String position;
    private String shift;

    // Default constructor
    public Staff() {
        super();
    }

    // Constructor to initialize Staff attributes
    public Staff(int userID, String username, String password, String email, String contactInfo, String role, 
                 int staffID, String position, String shift) {
        super(userID, username, password, email, contactInfo, role);
        this.staffID = staffID;
        this.position = position;
        this.shift = shift;
    }

    // Getters and Setters
    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    // Additional staff-specific methods
    public void manageReservations() {
        // Logic to manage reservations
        System.out.println("Managing reservations.");
    }

    public void respondToQueries() {
        // Logic to respond to customer queries
        System.out.println("Responding to queries.");
    }

    public void manageOrders() {
        // Logic to manage customer orders
        System.out.println("Managing orders.");
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staffID=" + staffID +
                ", position='" + position + '\'' +
                ", shift='" + shift + '\'' +
                ", username='" + getUsername() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", contactInfo='" + getContactInfo() + '\'' +
                ", role='" + getRole() + '\'' +
                '}';
    }
}
