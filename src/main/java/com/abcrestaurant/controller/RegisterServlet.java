package com.abcrestaurant.controller;

import com.abcrestaurant.dao.RegisterDAO;
import com.abcrestaurant.model.Register;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterDAO registerDAO;

    public void init() {
        registerDAO = new RegisterDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get input parameters from registration form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");
        String role = request.getParameter("role");

        // Validate if user already exists
        try {
			if (registerDAO.isUserExists(username, email)) {
			    request.setAttribute("errorMessage", "Username or Email already exists.");
			    request.getRequestDispatcher("register.jsp").forward(request, response);
			    return;
			}
		} catch (ClassNotFoundException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Create new user object
        Register newUser = new Register(username, password, email, contactInfo, role);

        // Register the user
        try {
			if (registerDAO.registerUser(newUser)) {
			    // If registration successful, redirect to login page
			    response.sendRedirect("login.jsp?success=Registration Successful. Please log in.");
			} else {
			    // If registration failed, send error message back to registration page
			    request.setAttribute("errorMessage", "An error occurred while registering. Please try again.");
			    request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
