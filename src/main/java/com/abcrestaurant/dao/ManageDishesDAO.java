package com.abcrestaurant.dao;

import com.abcrestaurant.model.ManageDishes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ManageDishesDAO {
    private Connection connection;

    public ManageDishesDAO(Connection connection) {
        this.connection = connection;
    }

    // Retrieve all dishes
    public List<ManageDishes> getAllDishes() {
        List<ManageDishes> dishes = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dishes";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ManageDishes dish = new ManageDishes();
                dish.setDishID(rs.getInt("dishID"));
                dish.setDishName(rs.getString("dishName"));
                dish.setCategory(rs.getString("category"));
                dish.setPrice(rs.getDouble("price"));
                dish.setAvailable(rs.getBoolean("available"));
                dishes.add(dish);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dishes;
    }

    // Add a new dish
    public boolean addDish(ManageDishes dish) {
        try {
            String sql = "INSERT INTO dishes (dishName, category, price, available) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, dish.getDishName());
            stmt.setString(2, dish.getCategory());
            stmt.setDouble(3, dish.getPrice());
            stmt.setBoolean(4, dish.isAvailable());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update an existing dish
    public boolean updateDish(ManageDishes dish) {
        try {
            String sql = "UPDATE dishes SET dishName = ?, category = ?, price = ?, available = ? WHERE dishID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, dish.getDishName());
            stmt.setString(2, dish.getCategory());
            stmt.setDouble(3, dish.getPrice());
            stmt.setBoolean(4, dish.isAvailable());
            stmt.setInt(5, dish.getDishID());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a dish
    public boolean deleteDish(int dishID) {
        try {
            String sql = "DELETE FROM dishes WHERE dishID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, dishID);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
