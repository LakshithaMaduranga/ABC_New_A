package com.abcrestaurant.controller;

import com.abcrestaurant.dao.RespondToQueriesDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RespondToQueryServlet")
public class RespondToQueriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Initialize DAO
    private RespondToQueriesDAO respondToQueriesDAO;

    public void init() {
        respondToQueriesDAO = new RespondToQueriesDAO();
    }

    // Handle POST request for sending response to a query
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String queryIDStr = request.getParameter("queryID");
        String responseMessage = request.getParameter("responseMessage");

        // Convert query ID to integer
        int queryID = Integer.parseInt(queryIDStr);

        // Call DAO to respond to the query
        boolean isResponseSent = false;
		try {
			isResponseSent = respondToQueriesDAO.respondToQuery(queryID, responseMessage);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (isResponseSent) {
            // Redirect to the queries list or show success message
            response.sendRedirect("respondToQueries.jsp?success=Response sent successfully");
        } else {
            // Handle failure case
            response.sendRedirect("respondToQueries.jsp?error=Failed to send response");
        }
    }
}
