<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard - ABC Restaurant</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-title {
            font-size: 1.5rem;
        }
        .card-text {
            font-size: 1.2rem;
        }
        .card-icon {
            font-size: 3rem;
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

    <!-- Main Dashboard Content -->
    <div class="container mt-5">
        <h1 class="text-center">Welcome, Staff Member</h1>
        <p class="text-center">Manage your tasks efficiently with the tools below.</p>
        
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <span class="card-icon text-primary">&#128197;</span>
                        <h5 class="card-title">Manage Reservations</h5>
                        <p class="card-text">View and manage customer reservations.</p>
                        <a href="manageReservations.jsp" class="btn btn-primary">Go to Reservations</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <span class="card-icon text-info">&#128172;</span>
                        <h5 class="card-title">Respond to Queries</h5>
                        <p class="card-text">Handle customer queries efficiently.</p>
                        <a href="respondToQuerys.jsp" class="btn btn-info">Go to Queries</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <span class="card-icon text-warning">&#128179;</span>
                        <h5 class="card-title">Manage Orders</h5>
                        <p class="card-text">Monitor and manage customer orders.</p>
                        <a href="manageOrders.jsp" class="btn btn-warning">Go to Orders</a>
                    </div>
                </div>
            </div>
        </div>
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
