<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">ABC Restaurant</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link btn btn-danger text-white" href="LogoutServlet">Admin Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <h2 class="text-center">Manage Users</h2>

    <!-- Users and Add New User Buttons -->
    <div class="d-flex justify-content-between mb-3">
        <a href="ManageUserServlet?action=list" class="btn btn-secondary">Users</a>
        <a href="ManageUserServlet?action=new" class="btn btn-primary">Add New User</a>
    </div>

    <!-- Users Table -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Contact Info</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the users list -->
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.userID}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td>${user.contactInfo}</td>
                    <td>
                        <!-- Edit Button -->
                        <a href="ManageUserServlet?action=edit&userID=${user.userID}" class="btn btn-success">Edit</a>
                        <!-- Delete Button -->
                        <a href="ManageUserServlet?action=delete&userID=${user.userID}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
