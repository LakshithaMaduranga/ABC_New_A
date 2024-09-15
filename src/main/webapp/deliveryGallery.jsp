<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery - Dishes Gallery</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"> <!-- For icons -->
    <style>
        .navbar {
            background-color: #2c3e50;
            padding: 10px 0; /* Adjusted padding to reduce height */
        }
        .navbar-brand, .nav-link {
            color: #ecf0f1 !important;
            padding: 5px 15px; /* Adjusted padding for navbar items */
        }
        .navbar-brand {
            font-size: 1.5rem;
        }
        .navbar-nav .nav-item .nav-link:hover {
            color: #e74c3c !important;
        }
        .cart-icon {
            position: relative;
            font-size: 1.5rem;
        }
        .badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: #e74c3c;
            color: white;
            border-radius: 50%;
            padding: 5px;
        }
        .container {
            margin-top: 70px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .btn {
            margin-right: 5px;
        }
        .btn-secondary i {
            margin-right: 5px;
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
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
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
                        <a class="nav-link cart-icon" href="cart.jsp">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge">
                                <%= session.getAttribute("cartItemCount") != null ? session.getAttribute("cartItemCount") : 0 %>
                            </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-danger text-white" href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Sorting and Filtering Section -->
    <div class="container mt-3">
        <form action="deliveryGallery.jsp" method="get" class="form-inline">
            <label for="sort" class="mr-2">Sort by:</label>
            <select name="sort" id="sort" class="form-control mr-2">
                <option value="priceLowToHigh">Price: Low to High</option>
                <option value="priceHighToLow">Price: High to Low</option>
                <option value="offerHighToLow">Offer: High to Low</option>
            </select>
            <button type="submit" class="btn btn-primary">Apply</button>
        </form>
    </div>

    <!-- Dishes Gallery Section -->
    <div class="container mt-4">
        <div class="row">
            <c:forEach var="dish" items="${dishes}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="${dish.image}" class="card-img-top" alt="${dish.name}">
                        <div class="card-body">
                            <h5 class="card-title">${dish.name}</h5>
                            <p class="card-text">${dish.description}</p>
                            <p class="card-text"><strong>$${dish.price}</strong></p>
                            <c:if test="${dish.offerPercentage > 0}">
                                <p class="card-text text-danger">${dish.offerPercentage}% OFF</p>
                            </c:if>
                            <div class="d-flex justify-content-between">
                                <a href="addToCartServlet?dishID=${dish.dishID}" class="btn btn-primary">Add to Cart</a>
                                <a href="addToFavoriteServlet?dishID=${dish.dishID}" class="btn btn-secondary">
                                    <i class="fas fa-heart"></i> Favorite
                                </a>
                                <a href="orderServlet?dishID=${dish.dishID}" class="btn btn-success">Order Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-5">
        <p class="text-center">&copy; 2024 ABC Restaurant. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
