package com.abcrestaurant.controller;

import com.abcrestaurant.dao.ReservationDAO;
import com.abcrestaurant.model.Reservation;
import com.abcrestaurant.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        // Check if the user is logged in
        if (loggedInUser == null) {
            response.sendRedirect("login.jsp?error=Please log in to access reservations.");
            return;
        }

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertReservation(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateReservation(request, response);
                break;
            case "delete":
                deleteReservation(request, response);
                break;
            default:
                listReservations(request, response);
                break;
        }
    }

    private void listReservations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Reservation> reservationList = null;
		try {
			reservationList = reservationDAO.getAllReservations();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("reservationList", reservationList);
        request.getRequestDispatcher("manageReservations.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("reservationForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationID = Integer.parseInt(request.getParameter("reservationID"));
        Reservation existingReservation = null;
		try {
			existingReservation = reservationDAO.getReservationById(reservationID);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("reservation", existingReservation);
        request.getRequestDispatcher("reservationForm.jsp").forward(request, response);
    }

    private void insertReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String customerName = request.getParameter("customerName");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        LocalTime time = LocalTime.parse(request.getParameter("time"));
        String status = request.getParameter("status");

        Reservation newReservation = new Reservation(customerName, date, time, status);
        try {
			reservationDAO.addReservation(newReservation);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("reservation?action=list&success=Reservation added successfully.");
    }

    private void updateReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reservationID = Integer.parseInt(request.getParameter("reservationID"));
        String customerName = request.getParameter("customerName");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        LocalTime time = LocalTime.parse(request.getParameter("time"));
        String status = request.getParameter("status");

        Reservation reservation = new Reservation(reservationID, customerName, date, time, status);
        try {
			reservationDAO.updateReservation(reservation);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("reservation?action=list&success=Reservation updated successfully.");
    }

    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reservationID = Integer.parseInt(request.getParameter("reservationID"));
        try {
			reservationDAO.deleteReservation(reservationID);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("reservation?action=list&success=Reservation deleted successfully.");
    }
}
