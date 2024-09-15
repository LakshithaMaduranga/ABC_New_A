package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ViewOrderDetailsDAO;
import com.abcrestaurant.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ViewOrderDetailsServlet")
public class ViewOrderDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ViewOrderDetailsDAO orderDetailsDAO;

    public void init() {
        orderDetailsDAO = new ViewOrderDetailsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the order ID from the request parameters
        String orderID = request.getParameter("orderID");

        if (orderID != null) {
            try {
                // Fetch the order details from the DAO
                Order order = orderDetailsDAO.getOrderDetails(Integer.parseInt(orderID));

                if (order != null) {
                    // Pass the order object to the JSP
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("viewOrderDetails.jsp").forward(request, response);
                } else {
                    // If no order found, redirect back to the manageOrders page with an error message
                    response.sendRedirect("manageOrders.jsp?error=Order Not Found");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("manageOrders.jsp?error=Error Fetching Order Details");
            }
        } else {
            response.sendRedirect("manageOrders.jsp?error=Invalid Order ID");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
