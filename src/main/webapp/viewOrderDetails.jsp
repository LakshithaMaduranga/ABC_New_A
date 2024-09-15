<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details - ABC Restaurant</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="staffDashboard.jsp">ABC Restaurant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="staffDashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manageReservations.jsp">Manage Reservations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="respondToQueries.jsp">Respond to Queries</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manageOrders.jsp">Manage Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="LogoutServlet">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Order Details Section -->
    <div class="container mt-5">
        <h3>Order Details for Order ID: ${order.orderID}</h3>
        <table class="table table-bordered">
            <tr>
                <th>Order ID</th>
                <td>${order.orderID}</td>
            </tr>
            <tr>
                <th>Customer Name</th>
                <td>${order.customerName}</td>
            </tr>
            <tr>
                <th>Date</th>
                <td>${order.date}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>${order.status}</td>
            </tr>
            <tr>
                <th>Total Amount</th>
                <td>${order.totalAmount}</td>
            </tr>
            <tr>
                <th>Items Ordered</th>
                <td>
                    <ul>
                        <c:forEach var="item" items="${order.items}">
                            <li>${item.name} - ${item.quantity}</li>
                        </c:forEach>
                    </ul>
                </td>
            </tr>
        </table>

        <!-- Form for Updating Order Status -->
        <h4>Update Order Status</h4>
        <form action="UpdateOrderStatusServlet" method="POST">
            <input type="hidden" name="orderID" value="${order.orderID}">
            <div class="form-group">
                <label for="status">Order Status:</label>
                <select name="status" id="status" class="form-control">
                    <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Confirmed" ${order.status == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                    <option value="Completed" ${order.status == 'Completed' ? 'selected' : ''}>Completed</option>
                    <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Status</button>
        </form>

        <!-- Back to Orders Button -->
        <a href="manageOrders.jsp" class="btn btn-secondary mt-3">Back to Orders</a>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
