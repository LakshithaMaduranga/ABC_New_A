package com.abcrestaurant.dao;

import com.abcrestaurant.model.ManageOrders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ManageOrdersDAO {
    private Connection connection;

    public ManageOrdersDAO(Connection connection) {
        this.connection = connection;
    }

    // Retrieve all orders
    public List<ManageOrders> getAllOrders() {
        List<ManageOrders> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM orders";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ManageOrders order = new ManageOrders();
                order.setOrderID(rs.getInt("orderID"));
                order.setCustomerName(rs.getString("customerName"));
                order.setDate(rs.getDate("date"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Update order status
    public boolean updateOrderStatus(int orderID, String status) {
        try {
            String sql = "UPDATE orders SET status = ? WHERE orderID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, orderID);

            int updatedRows = stmt.executeUpdate();
            return updatedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
