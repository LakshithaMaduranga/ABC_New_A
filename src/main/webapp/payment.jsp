<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - ABC Restaurant</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
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
                    <a class="nav-link" href="index.jsp#about">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp#gallery">Gallery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp#services">Services</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp#delivery">Delivery</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="LogoutServlet">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Payment Form -->
    <div class="container mt-5">
        <h2 class="text-center">Complete Your Payment</h2>
        <form id="paymentForm" class="mt-4">
            <div class="form-group">
                <label for="nameOnCard">Name on Card:</label>
                <input type="text" id="nameOnCard" name="nameOnCard" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" class="form-control" required pattern="\d{16}" placeholder="1234 5678 9012 3456">
            </div>
            <div class="form-group">
                <label for="expiryDate">Expiry Date:</label>
                <input type="text" id="expiryDate" name="expiryDate" class="form-control" required placeholder="MM/YY">
            </div>
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" class="form-control" required pattern="\d{3}" placeholder="123">
            </div>
            <div class="form-group">
                <label for="billingAddress">Billing Address:</label>
                <textarea id="billingAddress" name="billingAddress" class="form-control" rows="3" required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Pay Now</button>
            </div>
        </form>
    </div>

    <!-- Alert after payment -->
    <script>
        document.getElementById("paymentForm").addEventListener("submit", function(event) {
            event.preventDefault();
            alert("Payment Success! Your payment details have been sent to the admin panel.");
            window.location.href = "index.jsp";
        });
    </script>

    <!-- Footer -->
    <footer class="text-muted py-4 bg-light">
        <div class="container">
            <p class="mb-1">© 2024 ABC Restaurant. All rights reserved.</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Contact</a></li>
            </ul>
        </div>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
