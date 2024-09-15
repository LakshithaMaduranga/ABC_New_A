package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ManageUserDAO;
import com.abcrestaurant.model.ManageUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ManageUserServlet")
public class ManageUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ManageUserDAO userDAO;

    public void init() {
        userDAO = new ManageUserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertUser(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "list":
                    listUsers(request, response);
                    break;
                default:
                    listUsers(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        List<ManageUser> listUsers = userDAO.getAllUsers();
        request.setAttribute("users", listUsers);
        request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("userForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        ManageUser existingUser = userDAO.getUserByID(userID);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("userForm.jsp").forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ClassNotFoundException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String contactInfo = request.getParameter("contactInfo");  // Added contactInfo

        ManageUser newUser = new ManageUser();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setRole(role);
        newUser.setContactInfo(contactInfo);  // Added contactInfo

        userDAO.addUser(newUser);
        response.sendRedirect("ManageUserServlet?action=list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ClassNotFoundException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String contactInfo = request.getParameter("contactInfo");  // Added contactInfo

        ManageUser user = new ManageUser();
        user.setUserID(userID);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);
        user.setContactInfo(contactInfo);  // Added contactInfo

        userDAO.updateUser(user);
        response.sendRedirect("ManageUserServlet?action=list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ClassNotFoundException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        userDAO.deleteUser(userID);
        response.sendRedirect("ManageUserServlet?action=list");
    }
}
