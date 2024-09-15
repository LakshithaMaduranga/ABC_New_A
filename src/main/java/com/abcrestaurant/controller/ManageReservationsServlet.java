package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ManageReservationDAO;
import com.abcrestaurant.model.ManageReservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ManageReservationsServlet")
public class ManageReservationsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManageReservationDAO reservationDAO = new ManageReservationDAO();
        try {
            List<ManageReservation> reservations = reservationDAO.getAllReservations();
            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("manageReservations.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String reservationID = request.getParameter("reservationID");
        ManageReservationDAO reservationDAO = new ManageReservationDAO();

        try {
            if ("Confirm".equals(action)) {
                reservationDAO.updateReservationStatus(reservationID, "Confirmed");
            } else if ("Cancel".equals(action)) {
                reservationDAO.cancelReservation(reservationID);
            }
            response.sendRedirect("ManageReservationsServlet");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
