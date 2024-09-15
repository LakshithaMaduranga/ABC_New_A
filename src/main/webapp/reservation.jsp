<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - ABC Restaurant</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"> <!-- FontAwesome for icons -->
    <style>
        /* Navbar Styling */
        .navbar {
            background-color: #2c3e50;
            padding-top: 8px;  /* Adjust the top padding */
            padding-bottom: 8px; /* Adjust the bottom padding */
        }

        .navbar-brand, .nav-link {
            color: #ecf0f1 !important;
        }

        .navbar-brand span {
            color: #e74c3c;
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #e74c3c !important;
        }

        .cart-icon .badge {
            position: absolute;
            top: -5px;
            right: -10px;
        }

        /* Adjust margin to avoid overlap */
        .container {
            margin-top: 70px;  /* Adjust to match the reduced navbar height */
        }

    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">ABC <span>Restaurant</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="delivery.jsp">Delivery</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="reservation.jsp">Reservation <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="query.jsp">Query</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link cart-icon position-relative" href="cart.jsp">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge badge-danger">
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

    <!-- Reservation Form -->
    <div class="container">
     <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Make a Reservation</h3>
                        <form action="submitReservation" method="post">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" id="name" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="tel" id="phone" name="phone" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="date">Date:</label>
                                <input type="date" id="date" name="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="time">Time:</label>
                                <input type="time" id="time" name="time" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="guests">Number of Guests:</label>
                                <select id="guests" name="guests" class="form-control" required>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="requests">Special Requests:</label>
                                <textarea id="requests" name="requests" class="form-control" rows="3" placeholder="Any special requests or notes"></textarea>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-block">Submit Reservation</button>
                            </div>
                        </form>
                        <!-- Display success message after reservation submission -->
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
        </div>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
