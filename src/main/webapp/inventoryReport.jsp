<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Report - Admin Dashboard</title>
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
        <h1 class="text-center">Inventory Report</h1>
        <p class="text-center">Analyze the inventory levels and stock usage.</p>

        <!-- Date Range Filter -->
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

        <!-- Inventory Usage Chart -->
        <div class="report-section">
            <canvas id="inventoryUsageChart"></canvas>
        </div>

        <!-- Inventory Data Table -->
        <div class="report-section">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Category</th>
                        <th>Current Stock</th>
                        <th>Reorder Level</th>
                        <th>Last Updated</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Data Row -->
                    <tr>
                        <td>501</td>
                        <td>Chicken Breast</td>
                        <td>Meat</td>
                        <td>200 lbs</td>
                        <td>50 lbs</td>
                        <td>2024-09-15</td>
                    </tr>
                    <!-- Repeat for each inventory item -->
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

    <!-- Chart.js Script for Inventory Usage Visualization -->
    <script>
        var ctx = document.getElementById('inventoryUsageChart').getContext('2d');
        var inventoryUsageChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Chicken Breast', 'Tomatoes', 'Lettuce', 'Cheese', 'Buns'], // Example item names, replace with dynamic data
                datasets: [{
                    label: 'Usage (lbs)',
                    data: [300, 150, 200, 120, 180], // Example usage data, replace with dynamic data
                    backgroundColor: 'rgba(54, 162, 235, 0.7)',
                    borderColor: 'rgba(54, 162, 235, 1)',
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
