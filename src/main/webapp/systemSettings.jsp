<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Settings - Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .settings-section {
            margin-top: 30px;
        }
        .card-header {
            background-color: #343a40;
            color: #ffffff;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            margin-top: 20px;
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
        <h1 class="text-center">System Settings</h1>
        <p class="text-center">Configure and manage system preferences and security settings.</p>

        <!-- General Settings -->
        <div class="settings-section">
            <div class="card">
                <div class="card-header">
                    General Settings
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="restaurantName">Restaurant Name</label>
                            <input type="text" class="form-control" id="restaurantName" placeholder="Enter restaurant name">
                        </div>
                        <div class="form-group">
                            <label for="contactEmail">Contact Email</label>
                            <input type="email" class="form-control" id="contactEmail" placeholder="Enter contact email">
                        </div>
                        <div class="form-group">
                            <label for="timezone">Timezone</label>
                            <select class="form-control" id="timezone">
                                <option>GMT</option>
                                <option>EST</option>
                                <option>PST</option>
                                <!-- Add more timezones as needed -->
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Security Settings -->
        <div class="settings-section">
            <div class="card">
                <div class="card-header">
                    Security Settings
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="passwordPolicy">Password Policy</label>
                            <select class="form-control" id="passwordPolicy">
                                <option>Strong</option>
                                <option>Medium</option>
                                <option>Weak</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="twoFactorAuth">Two-Factor Authentication</label>
                            <select class="form-control" id="twoFactorAuth">
                                <option>Enabled</option>
                                <option>Disabled</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sessionTimeout">Session Timeout (minutes)</label>
                            <input type="number" class="form-control" id="sessionTimeout" placeholder="Enter session timeout">
                        </div>
                        <button type="submit" class="btn btn-primary">Update Security Settings</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Notification Preferences -->
        <div class="settings-section">
            <div class="card">
                <div class="card-header">
                    Notification Preferences
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label>Email Notifications</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="notifyReservations" checked>
                                <label class="form-check-label" for="notifyReservations">
                                    Notify me about new reservations
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="notifyQueries">
                                <label class="form-check-label" for="notifyQueries">
                                    Notify me about new customer queries
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="notifyOrders" checked>
                                <label class="form-check-label" for="notifyOrders">
                                    Notify me about new orders
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Notifications</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Backup and Restore -->
        <div class="settings-section">
            <div class="card">
                <div class="card-header">
                    Backup and Restore
                </div>
                <div class="card-body">
                    <form>
                        <button type="button" class="btn btn-danger">Create Backup</button>
                        <button type="button" class="btn btn-secondary">Restore Backup</button>
                    </form>
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
