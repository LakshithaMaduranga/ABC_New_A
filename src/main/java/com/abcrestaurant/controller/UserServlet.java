package com.abcrestaurant.controller;

import com.abcrestaurant.dao.UserDAO;
import com.abcrestaurant.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("login")) {
            loginUser(request, response);
        } else if (action.equals("register")) {
            registerUser(request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            User user = userDAO.authenticateUser(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);

                if (user.getRole().equals("Admin")) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if (user.getRole().equals("Staff")) {
                    response.sendRedirect("staffDashboard.jsp");
                } else if (user.getRole().equals("Customer")) {
                    response.sendRedirect("customerDashboard.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login error", e);
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");
        String role = request.getParameter("role");

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setContactInfo(contactInfo);
        newUser.setRole(role);

        try {
            userDAO.registerUser(newUser);
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Registration error", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
