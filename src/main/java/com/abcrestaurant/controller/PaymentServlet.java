package com.abcrestaurant.controller;

import com.abcrestaurant.dao.PaymentDAO;
import com.abcrestaurant.model.Payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private PaymentDAO paymentDAO;

    public void init() {
        paymentDAO = new PaymentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processPayment(request, response);
    }

    private void processPayment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reservationID = Integer.parseInt(request.getParameter("reservationID")); // Ensure this parameter is passed from the form
        String paymentMethod = request.getParameter("paymentMethod");
        double amount = Double.parseDouble(request.getParameter("amount")); // Ensure this parameter is passed from the form
        LocalDateTime paymentDate = LocalDateTime.now(); // Use the current date and time for the payment

        Payment payment = new Payment(reservationID, paymentMethod, amount, paymentDate);
        boolean paymentSuccess = paymentDAO.addPayment(payment);

        if (paymentSuccess) {
            // Payment was successful
            response.sendRedirect("paymentSuccess.jsp"); // Redirect to a success page
        } else {
            // Payment failed
            response.sendRedirect("payment.jsp?error=Payment failed. Please try again.");
        }
    }
}
