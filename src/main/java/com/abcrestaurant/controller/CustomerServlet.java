package com.abcrestaurant.controller;

import com.abcrestaurant.dao.CustomerDAO;
import com.abcrestaurant.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDAO customerDAO;

    public void init() {
        customerDAO = new CustomerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "addCustomer":
                    addCustomer(request, response);
                    break;
                case "updateCustomer":
                    updateCustomer(request, response);
                    break;
                case "deleteCustomer":
                    deleteCustomer(request, response);
                    break;
                case "viewCustomer":
                    viewCustomer(request, response);
                    break;
                default:
                    listCustomers(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    // Method to add a new customer
    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        Customer newCustomer = new Customer(0, username, password, email, contactInfo, "Customer", 0, address, phoneNumber);
        customerDAO.addCustomer(newCustomer);

        response.sendRedirect("customerList.jsp");
    }

    // Method to update an existing customer
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contactInfo = request.getParameter("contactInfo");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        Customer customer = new Customer(customerID, username, password, email, contactInfo, "Customer", customerID, address, phoneNumber);
        customerDAO.updateCustomer(customer);

        response.sendRedirect("customerList.jsp");
    }

    // Method to delete a customer
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        customerDAO.deleteCustomer(customerID);
        response.sendRedirect("customerList.jsp");
    }

    // Method to view a specific customer
    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        Customer customer = customerDAO.getCustomerByID(customerID);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("viewCustomer.jsp").forward(request, response);
    }

    // Method to list all customers
    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Customer> customerList = customerDAO.getAllCustomers();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customerList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
