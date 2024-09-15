package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ManageOrdersDAO;
import com.abcrestaurant.model.ManageOrders;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/ManageOrdersServlet")
public class ManageOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ManageOrdersDAO manageOrdersDAO;

    public void init() {
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        manageOrdersDAO = new ManageOrdersDAO(connection);
    }

    // Handles the GET request for displaying orders
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ManageOrders> orders = manageOrdersDAO.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
    }

    // Handles the POST request for updating order status
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIDStr = request.getParameter("orderID");
        String status = request.getParameter("status");

        int orderID = Integer.parseInt(orderIDStr);

        boolean isUpdated = manageOrdersDAO.updateOrderStatus(orderID, status);

        if (isUpdated) {
            response.sendRedirect("ManageOrdersServlet");
        } else {
            response.sendRedirect("manageOrders.jsp?error=Failed to update order status");
        }
    }
}
