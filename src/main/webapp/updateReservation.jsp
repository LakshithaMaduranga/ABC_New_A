<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Reservation - ABC Restaurant</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-label {
            font-weight: bold;
        }
        .form-section {
            margin-top: 30px;
        }
        footer {
            margin-top: 50px;
            padding: 20px 0;
            background-color: #f8f9fa;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">ABC Restaurant - Staff Dashboard</a>
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

    <!-- Update Reservation Form -->
    <div class="container form-section">
        <h1 class="text-center">Update Reservation</h1>
        <p class="text-center">Modify the reservation details and status as needed.</p>

        <form action="UpdateReservationServlet" method="post">
            <!-- Reservation ID (Hidden) -->
            <input type="hidden" name="reservationID" value="<%= request.getParameter("reservationID") %>">

            <!-- Customer Name -->
            <div class="form-group">
                <label for="customerName" class="form-label">Customer Name:</label>
                <input type="text" class="form-control" id="customerName" name="customerName" value="John Doe" readonly>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="john.doe@example.com" readonly>
            </div>

            <!-- Reservation Date -->
            <div class="form-group">
                <label for="reservationDate" class="form-label">Reservation Date:</label>
                <input type="date" class="form-control" id="reservationDate" name="reservationDate" value="2024-09-15" readonly>
            </div>

            <!-- Reservation Time -->
            <div class="form-group">
                <label for="reservationTime" class="form-label">Reservation Time:</label>
                <input type="time" class="form-control" id="reservationTime" name="reservationTime" value="19:00" readonly>
            </div>

            <!-- Number of Guests -->
            <div class="form-group">
                <label for="numberOfGuests" class="form-label">Number of Guests:</label>
                <input type="number" class="form-control" id="numberOfGuests" name="numberOfGuests" value="4" readonly>
            </div>

            <!-- Special Requests -->
            <div class="form-group">
                <label for="specialRequests" class="form-label">Special Requests:</label>
                <textarea class="form-control" id="specialRequests" name="specialRequests" rows="3" readonly>Vegan meal options.</textarea>
            </div>

            <!-- Reservation Status -->
            <div class="form-group">
                <label for="status" class="form-label">Reservation Status:</label>
                <select class="form-control" id="status" name="status">
                    <option value="Pending" <%= "Pending".equals("Pending") ? "selected" : "" %>>Pending</option>
                    <option value="Confirmed" <%= "Pending".equals("Confirmed") ? "selected" : "" %>>Confirmed</option>
                    <option value="Completed" <%= "Pending".equals("Completed") ? "selected" : "" %>>Completed</option>
                    <option value="Cancelled" <%= "Pending".equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                </select>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-success">Update Reservation</button>
                <a href="manageReservations.jsp" class="btn btn-secondary">Back to Reservations</a>
            </div>
        </form>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ABC Restaurant. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
