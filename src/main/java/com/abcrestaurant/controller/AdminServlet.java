package com.abcrestaurant.controller;

import com.abcrestaurant.dao.AdminDAO;
import com.abcrestaurant.model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;

    public void init() {
        adminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "login":
                    authenticateAdmin(request, response);
                    break;
                case "updateAdmin":
                    updateAdmin(request, response);
                    break;
                case "deleteAdmin":
                    deleteAdmin(request, response);
                    break;
                case "viewAdmins":
                    viewAdmins(request, response);
                    break;
                default:
                    response.sendRedirect("adminDashboard.jsp");
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    private void authenticateAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminDAO.authenticateAdmin(username, password);

        if (admin != null) {
            request.getSession().setAttribute("currentAdmin", admin);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid credentials!");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");

        Admin admin = new Admin(userID, username, password, email, contactInfo, "Admin");
        adminDAO.updateAdmin(admin);

        response.sendRedirect("viewAdmins.jsp");
    }

    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        adminDAO.deleteAdmin(userID);
        response.sendRedirect("viewAdmins.jsp");
    }

    private void viewAdmins(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Admin> admins = adminDAO.getAllAdmins();
        request.setAttribute("adminList", admins);
        request.getRequestDispatcher("viewAdmins.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
