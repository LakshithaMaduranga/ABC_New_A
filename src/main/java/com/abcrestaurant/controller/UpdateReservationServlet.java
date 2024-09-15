package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ReservationDAO;
import com.abcrestaurant.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the form parameters
        int reservationID = Integer.parseInt(request.getParameter("reservationID"));
        String status = request.getParameter("status");

        // Create a ReservationDAO instance to interact with the database
        ReservationDAO reservationDAO = new ReservationDAO();

        try {
            // Fetch the reservation from the database
            Reservation reservation = reservationDAO.getReservationById(reservationID);

            // Update the reservation status
            reservation.setStatus(status);

            // Update the reservation in the database
            reservationDAO.updateReservation(reservation);

            // Redirect back to the manage reservations page
            response.sendRedirect("manageReservations.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // If an error occurs, redirect to an error page or display an error message
            response.sendRedirect("error.jsp");
        }
    }
}
