<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - ABC Restaurant</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .card-body h4 {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }
        .btn-view {
            background-color: #3498db;
            color: #fff;
            border: none;
        }
        .btn-view:hover {
            background-color: #2980b9;
        }
        .table th {
            background-color: #34495e;
            color: #fff;
        }
        .badge-status {
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }
        .status-pending {
            background-color: #f39c12;
            color: white;
        }
        .status-confirmed {
            background-color: #27ae60;
            color: white;
        }
        .status-cancelled {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="customerDashboard.jsp">ABC Restaurant</a> <!-- Home now points to customerDashboard.jsp -->
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="customerDashboard.jsp">Home</a> <!-- Home points to customerDashboard.jsp -->
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-danger text-white ml-2" href="LogoutServlet">Logout</a> <!-- Logout button that logs out and redirects to index.jsp -->
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4">Profile Information</h2>

    <!-- User Details -->
    <div class="card mb-4">
        <div class="card-body">
            <h4>User Details</h4>
            <p><strong>Username:</strong> ${profile.username}</p>
            <p><strong>Email:</strong> ${profile.email}</p>
            <p><strong>Contact Info:</strong> ${profile.contactInfo}</p>
        </div>
    </div>

    <!-- Reservations Section -->
    <div class="card mb-4">
        <div class="card-body">
            <h4>Reservations</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reservation" items="${profile.reservations}">
                        <tr>
                            <td>${reservation.reservationID}</td>
                            <td>${reservation.date}</td>
                            <td>${reservation.time}</td>
                            <td>
                                <span class="badge badge-status
                                    <c:choose>
                                        <c:when test="${reservation.status == 'Pending'}">status-pending</c:when>
                                        <c:when test="${reservation.status == 'Confirmed'}">status-confirmed</c:when>
                                        <c:otherwise>status-cancelled</c:otherwise>
                                    </c:choose>">
                                    ${reservation.status}
                                </span>
                            </td>
                            <td>
                                <a href="viewReservationDetails.jsp?reservationID=${reservation.reservationID}" class="btn btn-view btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Messages and Responses Section -->
    <div class="card mb-4">
        <div class="card-body">
            <h4>Messages and Responses</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Query ID</th>
                        <th>Customer Message</th>
                        <th>Response</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="query" items="${profile.queries}">
                        <tr>
                            <td>${query.queryID}</td>
                            <td>${query.customerMessage}</td>
                            <td>${query.staffResponse}</td>
                            <td>
                                <a href="viewQueryDetails.jsp?queryID=${query.queryID}" class="btn btn-view btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Orders Section -->
    <div class="card mb-4">
        <div class="card-body">
            <h4>Orders</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${profile.orders}">
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${order.date}</td>
                            <td>${order.totalAmount}</td>
                            <td>
                                <span class="badge badge-status
                                    <c:choose>
                                        <c:when test="${order.status == 'Pending'}">status-pending</c:when>
                                        <c:when test="${order.status == 'Delivered'}">status-confirmed</c:when>
                                        <c:otherwise>status-cancelled</c:otherwise>
                                    </c:choose>">
                                    ${order.status}
                                </span>
                            </td>
                            <td>
                                <a href="viewOrderDetails.jsp?orderID=${order.orderID}" class="btn btn-view btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
