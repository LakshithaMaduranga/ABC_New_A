package com.abcrestaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.abcrestaurant.dao.ReservationDAO;
import com.abcrestaurant.model.User;

@WebServlet("/CancelReservationServlet")
public class CancelReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        // Check if the user is a staff member
        if (loggedInUser == null || !loggedInUser.getRole().equals("Staff")) {
            response.sendRedirect("login.jsp?error=Unauthorized+access");
            return;
        }

        String reservationIDStr = request.getParameter("reservationID");
        
        if (reservationIDStr == null || reservationIDStr.isEmpty()) {
            response.sendRedirect("manageReservations.jsp?error=Invalid+Reservation+ID");
            return;
        }

        int reservationID = Integer.parseInt(reservationIDStr);
        ReservationDAO reservationDAO = new ReservationDAO();
        
        // Get user confirmation
        String confirmation = request.getParameter("confirm");
        if (confirmation != null && confirmation.equals("yes")) {
            boolean success = reservationDAO.cancelReservation(reservationID);
            if (success) {
                response.sendRedirect("manageReservations.jsp?success=Reservation+cancelled");
            } else {
                response.sendRedirect("manageReservations.jsp?error=Unable+to+cancel+reservation");
            }
        } else {
            // Redirect to confirmation page if not yet confirmed
            response.sendRedirect("cancelReservation.jsp?reservationID=" + reservationID + "&confirmPrompt=true");
        }
    }
}
