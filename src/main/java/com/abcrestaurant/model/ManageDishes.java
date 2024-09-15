package com.abcrestaurant.model;

public class ManageDishes {
    private int dishID;
    private String dishName;
    private String category;
    private double price;
    private boolean available;

    // Constructors
    public ManageDishes() {}

    public ManageDishes(int dishID, String dishName, String category, double price, boolean available) {
        this.dishID = dishID;
        this.dishName = dishName;
        this.category = category;
        this.price = price;
        this.available = available;
    }

    // Getters and Setters
    public int getDishID() {
        return dishID;
    }

    public void setDishID(int dishID) {
        this.dishID = dishID;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
