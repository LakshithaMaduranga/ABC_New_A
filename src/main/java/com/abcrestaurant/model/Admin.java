package com.abcrestaurant.model;

public class Admin extends User {
    
    // Constructor with default values
    public Admin() {
        super();
    }

    // Constructor to initialize admin with specific values
    public Admin(int userID, String username, String password, String email, String contactInfo, String role) {
        super(userID, username, password, email, contactInfo, role); // Call parent class (User) constructor
    }

    // Admin-specific methods
    public void manageDishes() {
        // Implement logic for managing dishes (add/edit/remove)
        System.out.println("Admin is managing dishes.");
    }

    public void manageUsers() {
        // Implement logic for managing users
        System.out.println("Admin is managing users.");
    }

    public void manageOrders() {
        // Implement logic for managing orders
        System.out.println("Admin is managing orders.");
    }

    public void viewReports() {
        // Implement logic to view sales, customer, and order reports
        System.out.println("Admin is viewing reports.");
    }

    public void configureSettings() {
        // Implement logic to manage system settings
        System.out.println("Admin is configuring system settings.");
    }

    @Override
    public String toString() {
        return "Admin{" +
                "userID=" + getUserID() +
                ", username='" + getUsername() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", contactInfo='" + getContactInfo() + '\'' +
                ", role='" + getRole() + '\'' +
                '}';
    }
}
