<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Report - Admin Dashboard</title>
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
        <h1 class="text-center">Feedback Report</h1>
        <p class="text-center">Analyze customer feedback to improve service and satisfaction.</p>

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

        <!-- Feedback Sentiment Chart -->
        <div class="report-section">
            <canvas id="feedbackSentimentChart"></canvas>
        </div>

        <!-- Feedback Trends Chart -->
        <div class="report-section">
            <canvas id="feedbackTrendsChart"></canvas>
        </div>

        <!-- Feedback Data Table -->
        <div class="report-section">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Feedback ID</th>
                        <th>Date</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Sentiment</th>
                        <th>Comments</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Data Row -->
                    <tr>
                        <td>301</td>
                        <td>2024-09-15</td>
                        <td>Jane Doe</td>
                        <td>jane.doe@example.com</td>
                        <td>Positive</td>
                        <td>The food was amazing and the service was excellent!</td>
                    </tr>
                    <!-- Repeat for each feedback record -->
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

    <!-- Chart.js Scripts for Feedback Data Visualization -->
    <script>
        // Feedback Sentiment Chart
        var ctx1 = document.getElementById('feedbackSentimentChart').getContext('2d');
        var feedbackSentimentChart = new Chart(ctx1, {
            type: 'doughnut',
            data: {
                labels: ['Positive', 'Neutral', 'Negative'],
                datasets: [{
                    label: 'Feedback Sentiment',
                    data: [60, 30, 10], // Example data, replace with dynamic data
                    backgroundColor: [
                        'rgba(75, 192, 192, 0.7)',  // Positive
                        'rgba(255, 206, 86, 0.7)',  // Neutral
                        'rgba(255, 99, 132, 0.7)'   // Negative
                    ],
                    borderColor: [
                        'rgba(75, 192, 192, 1)',
                        'rgba(255, 206, 86, 1)',
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

        // Feedback Trends Chart
        var ctx2 = document.getElementById('feedbackTrendsChart').getContext('2d');
        var feedbackTrendsChart = new Chart(ctx2, {
            type: 'line',
            data: {
                labels: ['2024-09-10', '2024-09-11', '2024-09-12', '2024-09-13', '2024-09-14', '2024-09-15'],
                datasets: [{
                    label: 'Number of Feedbacks',
                    data: [10, 15, 8, 20, 18, 12], // Example data, replace with dynamic data
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
    </script>
</body>
</html>
