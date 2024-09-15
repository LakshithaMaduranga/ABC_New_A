package com.abcrestaurant.model;

public class Dish {
    private int dishID;
    private String name;
    private String description;
    private double price;
    private String image;
    private double offerPercentage;
    private boolean available;

    // No-argument constructor
    public Dish() {}

    // Constructor with parameters
    public Dish(int dishID, String name, String description, double price, String image, double offerPercentage, boolean available) {
        this.dishID = dishID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
        this.offerPercentage = offerPercentage;
        this.available = available;
    }

    // Getters and setters
    public int getDishID() {
        return dishID;
    }

    public void setDishID(int dishID) {
        this.dishID = dishID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getOfferPercentage() {
        return offerPercentage;
    }

    public void setOfferPercentage(double offerPercentage) {
        this.offerPercentage = offerPercentage;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    // Method to calculate the discounted price
    public double getDiscountedPrice() {
        return price * (1 - offerPercentage / 100);
    }

    @Override
    public String toString() {
        return "Dish{" +
                "dishID=" + dishID +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", offerPercentage=" + offerPercentage +
                ", available=" + available +
                '}';
    }
}
