<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - ABC Restaurant</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand, .nav-link, .cart-icon {
            color: #ecf0f1 !important;
        }
        .navbar-brand span {
            color: #e74c3c;
        }
        .cart-icon {
            font-size: 1.5rem;
            position: relative;
        }
        .cart-count {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: #e74c3c;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 0.75rem;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .footer {
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
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
                <li class="nav-item">
                    <a class="nav-link" href="reservation.jsp">Reservation</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="query.jsp">Query</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link cart-icon position-relative" href="cart.jsp" style="margin-right: 15px;">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count badge badge-danger position-absolute" style="top: -10px; right: -10px;">
                            <%= session.getAttribute("cartItemCount") != null ? session.getAttribute("cartItemCount") : 0 %>
                        </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white px-3" href="LogoutServlet" style="margin-left: 10px;">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

    <!-- Main Cart Content -->
    <div class="container mt-5">
        <h1 class="text-center">Your Shopping Cart</h1>
        <div class="table-responsive mt-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Cart Item -->
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.name}</td>
                            <td>${item.quantity}</td>
                            <td>$${item.price}</td>
                            <td>$${item.total}</td>
                            <td>
                                <a href="removeFromCartServlet?itemID=${item.id}" class="btn btn-danger btn-sm">Remove</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="text-right">
            <h4>Total: $<span><%= session.getAttribute("cartTotal") != null ? session.getAttribute("cartTotal") : 0 %></span></h4>
            <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 ABC Restaurant. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- For the shopping cart icon -->
</body>
</html>
