<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Report - Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .report-section {
            margin-top: 30px;
        }
        .table thead th {
            background-color: #343a40;
            color: #ffffff;
        }
        .form-inline .form-group {
            margin-right: 15px;
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
        <h1 class="text-center">Order Report</h1>
        <p class="text-center">Analyze the order data for different periods and statuses.</p>

        <!-- Date Range and Status Filter -->
        <div class="report-section">
            <form class="form-inline justify-content-center">
                <div class="form-group">
                    <label for="startDate">Start Date: </label>
                    <input type="date" class="form-control ml-2" id="startDate">
                </div>
                <div class="form-group">
                    <label for="endDate">End Date: </label>
                    <input type="date" class="form-control ml-2" id="endDate">
                </div>
                <div class="form-group">
                    <label for="orderStatus">Order Status: </label>
                    <select class="form-control ml-2" id="orderStatus">
                        <option>All</option>
                        <option>Pending</option>
                        <option>Completed</option>
                        <option>Cancelled</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>
        </div>

        <!-- Orders Summary Chart -->
        <div class="report-section">
            <canvas id="ordersSummaryChart"></canvas>
        </div>

        <!-- Orders Data Table -->
        <div class="report-section">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Customer</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Payment Method</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Data Row -->
                    <tr>
                        <td>1001</td>
                        <td>2024-09-15</td>
                        <td>John Doe</td>
                        <td>$150.00</td>
                        <td>Completed</td>
                        <td>Credit Card</td>
                    </tr>
                    <!-- Repeat for each order record -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ABC Restaurant. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapc.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Chart.js Script for Orders Summary Visualization -->
    <script>
        var ctx = document.getElementById('ordersSummaryChart').getContext('2d');
        var ordersSummaryChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Pending', 'Completed', 'Cancelled'],
                datasets: [{
                    label: 'Order Status',
                    data: [10, 40, 5], // Example data, replace with dynamic data
                    backgroundColor: [
                        'rgba(255, 206, 86, 0.7)',  // Pending
                        'rgba(75, 192, 192, 0.7)',  // Completed
                        'rgba(255, 99, 132, 0.7)'   // Cancelled
                    ],
                    borderColor: [
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(255, 99, 132, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                legend: {
                    position: 'top',
                }
            }
        });
    </script>
</body>
</html>
