package com.abcrestaurant.controller;

import com.abcrestaurant.dao.StaffDashboardDAO;
import com.abcrestaurant.model.StaffDashboard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/staffDashboard")
public class StaffDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDashboardDAO dashboardDAO = new StaffDashboardDAO();

        try {
            StaffDashboard dashboardStats = dashboardDAO.getDashboardStats();
            request.setAttribute("dashboardStats", dashboardStats);
            request.getRequestDispatcher("staffDashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
    }
}
