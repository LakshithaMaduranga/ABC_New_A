package com.abcrestaurant.model;

public class Register {
    private String username;
    private String password;
    private String email;
    private String contactInfo;
    private String role;

    // Default Constructor
    public Register() {
    }

    // Parameterized Constructor
    public Register(String username, String password, String email, String contactInfo, String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.contactInfo = contactInfo;
        this.role = role;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Register{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", contactInfo='" + contactInfo + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
