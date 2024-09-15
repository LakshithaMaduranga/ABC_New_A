<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">${user == null ? 'Add New User' : 'Edit User'}</h2>

    <!-- User Form -->
    <form action="ManageUserServlet?action=${user == null ? 'insert' : 'update'}" method="POST">
        <!-- Hidden input for userID, only used in edit -->
        <input type="hidden" name="userID" value="${user == null ? '' : user.userID}">
        
        <!-- Username Field -->
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" value="${user == null ? '' : user.username}" required>
        </div>
        
        <!-- Email Field -->
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" value="${user == null ? '' : user.email}" required>
        </div>

        <!-- Role Selection -->
        <div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="Admin" ${user != null && user.role == 'Admin' ? 'selected' : ''}>Admin</option>
                <option value="Staff" ${user != null && user.role == 'Staff' ? 'selected' : ''}>Staff</option>
                <option value="Customer" ${user != null && user.role == 'Customer' ? 'selected' : ''}>Customer</option>
            </select>
        </div>

        <!-- Password Field -->
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" value="${user == null ? '' : user.password}" required>
        </div>

        <!-- Contact Info Field -->
                           <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="tel" id="phone" name="phone" class="form-control" required>
                            </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">${user == null ? 'Add User' : 'Update User'}</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
