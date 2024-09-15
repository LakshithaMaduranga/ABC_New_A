package com.abcrestaurant.dao;

import com.abcrestaurant.model.Order;
import com.abcrestaurant.model.OrderItem;
import com.abcrestaurant.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ViewOrderDetailsDAO {

    public Order getOrderDetails(int orderID) throws SQLException, ClassNotFoundException {
        Order order = null;
        List<OrderItem> orderItems = new ArrayList<>();
        
        // SQL query to get order details
        String orderQuery = "SELECT Orders.orderID, Orders.orderDate, Orders.status, Orders.totalAmount, Users.username "
                + "FROM Orders "
                + "JOIN Users ON Orders.userID = Users.userID "
                + "WHERE Orders.orderID = ?";
        
        // SQL query to get order items
        String orderItemsQuery = "SELECT Dishes.dishName, OrderItems.quantity "
                + "FROM OrderItems "
                + "JOIN Dishes ON OrderItems.dishID = Dishes.dishID "
                + "WHERE OrderItems.orderID = ?";
        
        try (Connection connection = DBConnection.initializeDatabase()) {
            // Fetch order details
            PreparedStatement orderStatement = connection.prepareStatement(orderQuery);
            orderStatement.setInt(1, orderID);
            ResultSet orderResultSet = orderStatement.executeQuery();
            
            if (orderResultSet.next()) {
                String customerName = orderResultSet.getString("username");
                String date = orderResultSet.getString("orderDate");
                String status = orderResultSet.getString("status");
                double totalAmount = orderResultSet.getDouble("totalAmount");

                // Create an Order object
                order = new Order(orderID, customerName, date, status, totalAmount);
            }
            
            // Fetch order items
            PreparedStatement orderItemsStatement = connection.prepareStatement(orderItemsQuery);
            orderItemsStatement.setInt(1, orderID);
            ResultSet itemsResultSet = orderItemsStatement.executeQuery();
            
            while (itemsResultSet.next()) {
                String itemName = itemsResultSet.getString("dishName");
                int quantity = itemsResultSet.getInt("quantity");
                orderItems.add(new OrderItem(itemName, quantity));
            }
            
            // Attach order items to the order object
            if (order != null) {
                order.setItems(orderItems);
            }
        }
        
        return order;
    }
}
