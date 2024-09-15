<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Respond to Query - ABC Restaurant</title>
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

    <!-- Respond to Query Section -->
    <div class="container form-section">
        <h1 class="text-center">Respond to Query</h1>
        <p class="text-center">Provide a response to the customer's query below.</p>

        <form action="RespondToQueryServlet" method="post">
            <!-- Query ID (Hidden) -->
            <input type="hidden" name="queryID" value="<%= request.getParameter("queryID") %>">

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

            <!-- Subject -->
            <div class="form-group">
                <label for="subject" class="form-label">Subject:</label>
                <input type="text" class="form-control" id="subject" name="subject" value="Reservation Issue" readonly>
            </div>

            <!-- Message -->
            <div class="form-group">
                <label for="message" class="form-label">Message:</label>
                <textarea class="form-control" id="message" name="message" rows="5" readonly>Can you please confirm if my reservation is still active?</textarea>
            </div>

            <!-- Response -->
            <div class="form-group">
                <label for="responseMessage" class="form-label">Your Response:</label>
                <textarea class="form-control" id="responseMessage" name="responseMessage" rows="5" required></textarea>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-success">Send Response</button>
                <a href="respondToQueries.jsp" class="btn btn-secondary">Back to Queries</a>
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
