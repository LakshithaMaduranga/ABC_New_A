<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reports - Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .report-section {
            margin-top: 30px;
        }
        .card-title {
            font-size: 1.5rem;
        }
        .card-text {
            font-size: 1.2rem;
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

    <div class="container mt-5">
        <h1 class="text-center">View Reports</h1>
        <p class="text-center">Analyze sales and customer data with detailed reports.</p>
        
        <div class="row report-section">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Sales Report</h5>
                        <p class="card-text">View detailed sales data for different periods.</p>
                        <a href="salesReport.jsp" class="btn btn-primary">View Sales Report</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Customer Report</h5>
                        <p class="card-text">Analyze customer demographics and behavior.</p>
                        <a href="customerReport.jsp" class="btn btn-success">View Customer Report</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Order Report</h5>
                        <p class="card-text">Review detailed data on orders over time.</p>
                        <a href="orderReport.jsp" class="btn btn-warning">View Order Report</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row report-section">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Inventory Report</h5>
                        <p class="card-text">Monitor inventory levels and stock management.</p>
                        <a href="inventoryReport.jsp" class="btn btn-danger">View Inventory Report</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Revenue Report</h5>
                        <p class="card-text">Track revenue growth and financial performance.</p>
                        <a href="revenueReport.jsp" class="btn btn-info">View Revenue Report</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Feedback Report</h5>
                        <p class="card-text">Review customer feedback and satisfaction.</p>
                        <a href="feedbackReport.jsp" class="btn btn-secondary">View Feedback Report</a>
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
