package com.abcrestaurant.controller;

import com.abcrestaurant.dao.UpdateOrderStatusDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UpdateOrderStatusDAO updateOrderStatusDAO;

    public void init() {
        updateOrderStatusDAO = new UpdateOrderStatusDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the order ID and new status from the form
        String orderID = request.getParameter("orderID");
        String newStatus = request.getParameter("status");

        try {
            // Update the order status using DAO
            boolean isUpdated = updateOrderStatusDAO.updateOrderStatus(Integer.parseInt(orderID), newStatus);

            if (isUpdated) {
                // If the update is successful, redirect to manage orders with a success message
                response.sendRedirect("manageOrders.jsp?success=Order status updated successfully.");
            } else {
                // If the update fails, redirect with an error message
                response.sendRedirect("manageOrders.jsp?error=Failed to update order status.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("manageOrders.jsp?error=An error occurred while updating the order status.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
