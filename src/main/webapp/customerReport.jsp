<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Report - Admin Dashboard</title>
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
        <h1 class="text-center">Customer Report</h1>
        <p class="text-center">Analyze customer demographics and behavior.</p>

        <!-- Customer Search -->
        <div class="report-section">
            <form class="form-inline justify-content-center">
                <div class="form-group">
                    <label for="customerName">Customer Name: </label>
                    <input type="text" class="form-control ml-2" id="customerName" placeholder="Enter customer name">
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <!-- Customer Demographics Chart -->
        <div class="report-section">
            <canvas id="customerDemographicsChart"></canvas>
        </div>

        <!-- Customer Activity Chart -->
        <div class="report-section">
            <canvas id="customerActivityChart"></canvas>
        </div>

        <!-- Customer Data Table -->
        <div class="report-section">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Total Orders</th>
                        <th>Total Spend</th>
                        <th>Last Order Date</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Data Row -->
                    <tr>
                        <td>101</td>
                        <td>Jane Smith</td>
                        <td>jane.smith@example.com</td>
                        <td>12</td>
                        <td>$1200.00</td>
                        <td>2024-09-15</td>
                    </tr>
                    <!-- Repeat for each customer -->
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

    <!-- Chart.js Scripts for Customer Data Visualization -->
    <script>
        // Customer Demographics Chart
        var ctx1 = document.getElementById('customerDemographicsChart').getContext('2d');
        var customerDemographicsChart = new Chart(ctx1, {
            type: 'doughnut',
            data: {
                labels: ['18-25', '26-35', '36-45', '46-60', '60+'],
                datasets: [{
                    label: 'Age Group',
                    data: [30, 50, 20, 40, 10],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 206, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
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

        // Customer Activity Chart
        var ctx2 = document.getElementById('customerActivityChart').getContext('2d');
        var customerActivityChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['Jane Smith', 'John Doe', 'Alice Brown', 'Tom White'],
                datasets: [{
                    label: 'Total Spend ($)',
                    data: [1200, 950, 800, 1500],
                    backgroundColor: 'rgba(75, 192, 192, 0.7)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                responsive: true,
                legend: {
                    display: false
                }
            }
        });
    </script>
</body>
</html>
