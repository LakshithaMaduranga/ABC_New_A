package com.abcrestaurant.controller;

import com.abcrestaurant.dao.StaffDAO;
import com.abcrestaurant.model.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO staffDAO;

    public void init() {
        staffDAO = new StaffDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "addStaff":
                    addStaff(request, response);
                    break;
                case "updateStaff":
                    updateStaff(request, response);
                    break;
                case "deleteStaff":
                    deleteStaff(request, response);
                    break;
                case "viewStaff":
                    viewStaff(request, response);
                    break;
                default:
                    listStaff(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    // Method to add a new staff member
    private void addStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");
        String position = request.getParameter("position");
        String shift = request.getParameter("shift");

        Staff newStaff = new Staff(0, username, password, email, contactInfo, "Staff", 0, position, shift);
        staffDAO.addStaff(newStaff);

        response.sendRedirect("staffList.jsp");
    }

    // Method to update an existing staff member
    private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");
        String position = request.getParameter("position");
        String shift = request.getParameter("shift");

        Staff staff = new Staff(staffID, username, password, email, contactInfo, "Staff", staffID, position, shift);
        staffDAO.updateStaff(staff);

        response.sendRedirect("staffList.jsp");
    }

    // Method to delete a staff member
    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        staffDAO.deleteStaff(staffID);
        response.sendRedirect("staffList.jsp");
    }

    // Method to view a specific staff member
    private void viewStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        Staff staff = staffDAO.getStaffByID(staffID);
        request.setAttribute("staff", staff);
        request.getRequestDispatcher("viewStaff.jsp").forward(request, response);
    }

    // Method to list all staff members
    private void listStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Staff> staffList = staffDAO.getAllStaff();
        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("staffList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
