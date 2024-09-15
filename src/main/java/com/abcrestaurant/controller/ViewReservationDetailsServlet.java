package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ReservationDAO;
import com.abcrestaurant.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ViewReservationDetailsServlet")
public class ViewReservationDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the reservationID from the request
            int reservationID = Integer.parseInt(request.getParameter("reservationID"));

            // Use ReservationDAO to fetch the reservation details
            ReservationDAO reservationDAO = new ReservationDAO();
            Reservation reservation = reservationDAO.getReservationById(reservationID);

            // Set the reservation details as a request attribute
            request.setAttribute("reservation", reservation);

            // Forward the request to the JSP page
            request.getRequestDispatcher("viewReservationDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Handle cases where the reservationID is not a valid number
            request.setAttribute("errorMessage", "Invalid reservation ID");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);

        } catch (Exception e) {
            // General exception handling (IOException, ServletException, etc.)
            request.setAttribute("errorMessage", "An error occurred while processing the request.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}
