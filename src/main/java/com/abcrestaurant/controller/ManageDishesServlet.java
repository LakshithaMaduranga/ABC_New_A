package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ManageDishesDAO;
import com.abcrestaurant.model.ManageDishes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/ManageDishesServlet")
public class ManageDishesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ManageDishesDAO manageDishesDAO;

    public void init() {
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        manageDishesDAO = new ManageDishesDAO(connection);
    }

    // Handle GET requests (Display all dishes)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ManageDishes> dishes = manageDishesDAO.getAllDishes();
        request.setAttribute("dishes", dishes);
        request.getRequestDispatcher("manageDishes.jsp").forward(request, response);
    }

    // Handle POST requests (Add, Update, Delete dishes)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addDish(request, response);
                    break;
                case "update":
                    updateDish(request, response);
                    break;
                case "delete":
                    deleteDish(request, response);
                    break;
                default:
                    response.sendRedirect("manageDishes.jsp?error=Invalid action");
            }
        }
    }

    // Add a new dish
    private void addDish(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dishName = request.getParameter("dishName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        boolean available = Boolean.parseBoolean(request.getParameter("available"));

        ManageDishes dish = new ManageDishes(0, dishName, category, price, available);

        boolean isAdded = manageDishesDAO.addDish(dish);

        if (isAdded) {
            response.sendRedirect("ManageDishesServlet");
        } else {
            response.sendRedirect("manageDishes.jsp?error=Failed to add dish");
        }
    }

    // Update an existing dish
    private void updateDish(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dishID = Integer.parseInt(request.getParameter("dishID"));
        String dishName = request.getParameter("dishName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        boolean available = Boolean.parseBoolean(request.getParameter("available"));

        ManageDishes dish = new ManageDishes(dishID, dishName, category, price, available);

        boolean isUpdated = manageDishesDAO.updateDish(dish);

        if (isUpdated) {
            response.sendRedirect("ManageDishesServlet");
        } else {
            response.sendRedirect("manageDishes.jsp?error=Failed to update dish");
        }
    }

    // Delete a dish
    private void deleteDish(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dishID = Integer.parseInt(request.getParameter("dishID"));

        boolean isDeleted = manageDishesDAO.deleteDish(dishID);

        if (isDeleted) {
            response.sendRedirect("ManageDishesServlet");
        } else {
            response.sendRedirect("manageDishes.jsp?error=Failed to delete dish");
        }
    }
}
