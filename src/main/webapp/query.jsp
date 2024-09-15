<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - ABC Restaurant</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

    <!-- Navbar -->
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">ABC <span style="color: #e74c3c;">Restaurant</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="delivery.jsp">Delivery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reservation.jsp">Reservation</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link cart-icon position-relative" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="badge badge-danger position-absolute" style="top: -10px; right: -10px;">
                            <%= session.getAttribute("cartItemCount") != null ? session.getAttribute("cartItemCount") : 0 %>
                        </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white ml-2" href="LogoutServlet">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


    <!-- Contact Form Section -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Contact Us</h3>
                        <p class="text-center">Have a question, feedback, or inquiry? Please fill out the form below, and we'll get back to you as soon as possible.</p>
                        <form action="submitQuery" method="post">
                            <div class="form-group">
                                <label for="name">Name (optional):</label>
                                <input type="text" id="name" name="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="subject">Subject:</label>
                                <select id="subject" name="subject" class="form-control" required>
                                    <option value="Feedback">Feedback</option>
                                    <option value="Reservation">Reservation</option>
                                    <option value="Menu Inquiry">Menu Inquiry</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="message">Message:</label>
                                <textarea id="message" name="message" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-block">Send Message</button>
                            </div>
                        </form>
                        <!-- Display success message after query submission -->
                        <%
                            String success = request.getParameter("success");
                            if (success != null) {
                                out.println("<p class='text-success text-center mt-3'>" + success + "</p>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
