<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revenue Report - Admin Dashboard</title>
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
        <h1 class="text-center">Revenue Report</h1>
        <p class="text-center">Analyze the revenue generated over different periods and from various sources.</p>

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

        <!-- Revenue Trend Chart -->
        <div class="report-section">
            <canvas id="revenueTrendChart"></canvas>
        </div>

        <!-- Revenue by Source Chart -->
        <div class="report-section">
            <canvas id="revenueBySourceChart"></canvas>
        </div>

        <!-- Revenue Data Table -->
        <div class="report-section">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Total Revenue</th>
                        <th>Online Orders</th>
                        <th>Dine-In</th>
                        <th>Special Events</th>
                        <th>Other</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Data Row -->
                    <tr>
                        <td>2024-09-15</td>
                        <td>$5000.00</td>
                        <td>$2000.00</td>
                        <td>$1500.00</td>
                        <td>$1000.00</td>
                        <td>$500.00</td>
                    </tr>
                    <!-- Repeat for each revenue record -->
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

    <!-- Chart.js Scripts for Revenue Data Visualization -->
    <script>
        // Revenue Trend Chart
        var ctx1 = document.getElementById('revenueTrendChart').getContext('2d');
        var revenueTrendChart = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ['2024-09-10', '2024-09-11', '2024-09-12', '2024-09-13', '2024-09-14', '2024-09-15'],
                datasets: [{
                    label: 'Total Revenue ($)',
                    data: [4000, 4500, 3500, 5000, 6000, 5500], // Example data, replace with dynamic data
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
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
                },
                responsive: true,
                legend: {
                    position: 'top',
                }
            }
        });

        // Revenue by Source Chart
        var ctx2 = document.getElementById('revenueBySourceChart').getContext('2d');
        var revenueBySourceChart = new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: ['Online Orders', 'Dine-In', 'Special Events', 'Other'],
                datasets: [{
                    label: 'Revenue by Source',
                    data: [2000, 1500, 1000, 500], // Example data, replace with dynamic data
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
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
    </script>
</body>
</html>
