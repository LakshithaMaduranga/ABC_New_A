<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Queries - ABC Restaurant</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp">ABC Restaurant</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="staff.jsp">Staff Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageReservations.jsp">Manage Reservations</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="manageQueries.jsp">Manage Queries <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Manage Queries -->
<div class="container mt-5">
    <h2 class="text-center">Manage Customer Queries</h2>

    <!-- Success or Error Messages -->
    <c:if test="${not empty param.success}">
        <div class="alert alert-success" role="alert">
            ${param.success}
        </div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger" role="alert">
            ${param.error}
        </div>
    </c:if>

    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="query" items="${queryList}">
                <tr>
                    <td>${query.queryID}</td>
                    <td>${query.customerName}</td>
                    <td>${query.email}</td>
                    <td>${query.subject}</td>
                    <td>${query.message}</td>
                    <td>${query.status}</td>
                    <td>
                        <!-- View and Respond Buttons -->
                        <a href="respondToQuery.jsp?queryID=${query.queryID}" class="btn btn-info btn-sm">View</a>
                        <a href="respondToQuery.jsp?queryID=${query.queryID}" class="btn btn-primary btn-sm">Respond</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer -->
<footer class="text-muted py-4 bg-light">
    <div class="container">
        <p class="mb-1">© 2024 ABC Restaurant. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
