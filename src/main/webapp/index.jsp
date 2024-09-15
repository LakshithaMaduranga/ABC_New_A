<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Welcome</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: white;
        }
        .navbar {
            background-color:#343a40;
        }
        .navbar-brand, .nav-link {
            color: #ecf0f1 !important;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
        }
        .navbar-brand span {
            color: #e74c3c;
        }
        .navbar-nav .nav-item .nav-link:hover {
            color: #e74c3c !important;
        }
        .navbar-nav .nav-item + .nav-item {
            margin-left: 15px;
        }
        .hero-section {
            position: relative;
            width: 100%;
            height: 600px;
            overflow: hidden;
        }
        .hero-section img {
            width: 100%;
            height: 600px;
            object-fit: cover;
            display: none;
        }
        .hero-section img.active {
            display: block;
        }
        .section-title {
            text-align: center;
            margin: 50px 0 30px;
            font-size: 2.5rem;
            color: #2c3e50;
        }
        .card {
            transition: transform 0.3s ease-in-out;
            border: none;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 250px;
            object-fit: cover;
        }
        .gallery-section, .services-section, .about-section, .reservation-section, .query-section {
            padding: 50px 0;
        }
        .footer {
            background-color: #2c3e50;
            color: white;
            padding: 30px 0;
            text-align: center;
            margin-top: 50px;
        }
        .footer p {
            margin: 0;
            color: #bdc3c7;
        }
        .footer a {
            color: #e74c3c;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Nav-bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">ABC <span>Restaurant</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="#services">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#gallery">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#reservation">Reservation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#query">Query</a>
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
                        <a class="nav-link btn btn-primary text-white" href="login.jsp" style="margin-right: 10px;">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary text-white" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section with Modern Design and Order Button -->
<header class="hero-section position-relative">
    <div id="heroCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/restaurant-banner1.jpg" class="d-block w-100" alt="Restaurant Banner 1">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="display-4 font-weight-bold">Welcome to ABC Restaurant</h1>
                    <p class="lead">Delicious meals delivered to your doorstep.</p>
                    <a href="deliveryGallery.jsp" class="btn btn-primary btn-lg">Order Now</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/restaurant-banner2.jpg" class="d-block w-100" alt="Restaurant Banner 2">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="display-4 font-weight-bold">Experience Fine Dining</h1>
                    <p class="lead">Join us for an unforgettable culinary journey.</p>
                    <a href="deliveryGallery.jsp" class="btn btn-primary btn-lg">Order Now</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/restaurant-banner3.jpg" class="d-block w-100" alt="Restaurant Banner 3">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="display-4 font-weight-bold">Exclusive Offers Just for You</h1>
                    <p class="lead">Check out our special offers on your favorite dishes.</p>
                    <a href="deliveryGallery.jsp" class="btn btn-primary btn-lg">Order Now</a>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>
    <!-- About Us Section -->
   <section id="about" class="about-section py-5 bg-light">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <img src="images/about-us.jpg" class="img-fluid rounded" alt="About Us">
            </div>
            <div class="col-lg-6">
                <h2 class="section-title font-weight-bold">About Us</h2>
                <p class="lead">Welcome to ABC Restaurant, where tradition meets innovation. We take pride in using only the freshest ingredients to create delicious meals for our guests. Whether you're dining in or ordering delivery, our culinary team is dedicated to ensuring a memorable experience for you and your loved ones.</p>
                <p>At ABC Restaurant, we believe that food is not just nourishment but a way to bring people together. From our kitchen to your table, we strive to provide the best service and the most exquisite flavors.</p>
                <a href="#reservation" class="btn btn-outline-primary btn-lg">Reserve a Table</a>
            </div>
        </div>
    </div>
</section>

    <!-- Gallery Section -->
    <section id="gallery" class="gallery-section">
        <div class="container">
            <h2 class="section-title">Our Gallery</h2>
            <div class="row text-center">
                <div class="col-md-3">
                    <div class="card mb-4">
                        <img src="images/img2.jpg" class="card-img-top" alt="Dishes">
                        <div class="card-body">
                            <h5 class="card-title">Dishes</h5>
                            <a href="deliveryGallery.jsp?category=dishes" class="btn btn-danger">View Dishes</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-4">
                        <img src="images/img3.jpg" class="card-img-top" alt="Offer Dishes">
                        <div class="card-body">
                            <h5 class="card-title">Offer Dishes</h5>
                            <a href="deliveryGallery.jsp?category=offer" class="btn btn-danger">View Offers</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-4">
                        <img src="images/img4.jpg" class="card-img-top" alt="Favorite Dishes">
                        <div class="card-body">
                            <h5 class="card-title">Favorite Dishes</h5>
                            <a href="deliveryGallery.jsp?category=favorite" class="btn btn-danger">View Favorites</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-4">
                        <img src="images/img5.jpg" class="card-img-top" alt="Drinks">
                        <div class="card-body">
                            <h5 class="card-title">Drinks</h5>
                            <a href="deliveryGallery.jsp?category=drinks" class="btn btn-danger">View Drinks</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="services-section">
        <div class="container">
            <h2 class="section-title">Our Services</h2>
            <div class="row text-center">
                <div class="col-md-6">
                    <div class="card mb-4">
                        <img src="images/reservation.webp" class="card-img-top" alt="Reservation">
                        <div class="card-body">
                            <h5 class="card-title">Reservation</h5>
                            <p class="card-text">Book your table online and ensure a great dining experience with us.</p>
                            <a href="reservation.jsp" class="btn btn-danger">Make a Reservation</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mb-4">
                        <img src="images/img1.jpg" class="card-img-top" alt="Delivery">
                        <div class="card-body">
                            <h5 class="card-title">Delivery</h5>
                            <p class="card-text">Get your favorite dishes delivered to your doorstep quickly and safely.</p>
                            <a href="deliveryGallery.jsp" class="btn btn-danger">Order Delivery</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Chef Section -->
<section id="chefs" class="chef-section">
    <div class="container">
        <h2 class="section-title">Meet Our Chefs</h2>
        <p class="text-center">Our chefs bring a wealth of experience and passion for creating unforgettable dining experiences.</p>
        <div class="row text-center">
            <!-- Chef 1 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="images/chef1.jpg" class="card-img-top" alt="Chef John">
                    <div class="card-body">
                        <h5 class="card-title">Chef John Doe</h5>
                        <p class="card-text">Specializing in Italian cuisine with over 15 years of experience, Chef John is renowned for his hand-crafted pasta and unique sauces.</p>
                    </div>
                </div>
            </div>
            <!-- Chef 2 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="images/chef2.jpg" class="card-img-top" alt="Chef Sarah">
                    <div class="card-body">
                        <h5 class="card-title">Chef Sarah Lee</h5>
                        <p class="card-text">A culinary artist in Asian fusion, Chef Sarah creates a perfect blend of traditional and modern flavors to delight your taste buds.</p>
                    </div>
                </div>
            </div>
            <!-- Chef 3 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="images/chef3.jpg" class="card-img-top" alt="Chef Michael">
                    <div class="card-body">
                        <h5 class="card-title">Chef Michael Brown</h5>
                        <p class="card-text">With a flair for French cuisine, Chef Michael has been featured in numerous culinary magazines for his elegant and innovative dishes.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Reservation Section -->
    <section id="reservation" class="reservation-section">
        <div class="container">
            <h2 class="section-title">Make a Reservation</h2>
            <form action="submitReservation" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="date">Date</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="time">Time</label>
                        <input type="time" class="form-control" id="time" name="time" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="guests">Number of Guests</label>
                    <select class="form-control" id="guests" name="guests" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="specialRequests">Special Requests</label>
                    <textarea class="form-control" id="specialRequests" name="specialRequests" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit Reservation</button>
            </form>
        </div>
    </section>

    <!-- Query Section -->
    <section id="query" class="query-section">
        <div class="container">
            <h2 class="section-title">Send Us a Query</h2>
            <form action="submitQuery" method="post">
                <div class="form-group">
                    <label for="queryName">Your Name (Optional)</label>
                    <input type="text" class="form-control" id="queryName" name="queryName">
                </div>
                <div class="form-group">
                    <label for="queryEmail">Your Email</label>
                    <input type="email" class="form-control" id="queryEmail" name="queryEmail" required>
                </div>
                <div class="form-group">
                    <label for="queryMessage">Your Message</label>
                    <textarea class="form-control" id="queryMessage" name="queryMessage" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Query</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 ABC Restaurant. All Rights Reserved.</p>
        <p>2/17, Nawinna st, Bauddaloka Mawatha, Kurunegala. | Phone: (+94) 775122233 | Email: <a href="mailto:info@abcrestaurant.com">info@abcrestaurant.com</a></p>
        <div>
            <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
        </div>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript for Hero Section Slider -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let currentSlide = 0;
            const slides = document.querySelectorAll(".hero-section img");
            const totalSlides = slides.length;

            function showSlide(index) {
                slides.forEach((slide, i) => {
                    slide.classList.remove("active");
                    if (i === index) {
                        slide.classList.add("active");
                    }
                });
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % totalSlides;
                showSlide(currentSlide);
            }

            setInterval(nextSlide, 5000); // Change slide every 5 seconds
        });
    </script>
</body>
</html>
