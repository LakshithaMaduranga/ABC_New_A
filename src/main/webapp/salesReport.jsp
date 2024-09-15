<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Report - Admin Dashboard</title>
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
        <h1 class="text-center">Sales Report</h1>
        <p class="text-center">Analyze the sales data for different periods.</p>

        <!-- Date Range Selection -->
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
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>
        </div>

        <!-- Sales Chart -->
        <div class="report-section">
            <canvas id="salesChart"></canvas>
        </div>

        <!-- Sales Data Table -->
        <div class="report-section">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Total Amount</th>
                        <th>Payment Method</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Data Row -->
                    <tr>
                        <td>2024-09-15</td>
                        <td>1001</td>
                        <td>John Doe</td>
                        <td>$150.00</td>
                        <td>Credit Card</td>
                    </tr>
                    <!-- Repeat for each sales record -->
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Chart.js Script for Sales Data Visualization -->
    <script>
        var ctx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['2024-09-10', '2024-09-11', '2024-09-12', '2024-09-13', '2024-09-14', '2024-09-15'],
                datasets: [{
                    label: 'Sales Amount ($)',
                    data: [1200, 1500, 900, 1800, 2000, 1500],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    fill: true,
                    lineTension: 0.3
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
</body>
</html>
