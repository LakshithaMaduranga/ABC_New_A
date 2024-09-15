<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Dishes - Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table thead th {
            background-color: #343a40;
            color: #ffffff;
        }
        .btn-primary, .btn-success, .btn-danger {
            margin-right: 10px;
        }
        .modal-header {
            background-color: #343a40;
            color: #ffffff;
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <h1 class="text-center">Manage Dishes</h1>
        <p class="text-center">Add, edit, or remove dishes from the menu.</p>

        <div class="text-right mb-3">
            <button class="btn btn-primary" data-toggle="modal" data-target="#addDishModal">Add New Dish</button>
        </div>

        <!-- Dishes Table -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Dish ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Available</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example Data Row -->
                <tr>
                    <td>101</td>
                    <td><img src="images/dish1.jpg" alt="Dish Image" width="60" height="40"></td>
                    <td>Grilled Chicken</td>
                    <td>Main Course</td>
                    <td>$12.99</td>
                    <td>Yes</td>
                    <td>
                        <button class="btn btn-success" data-toggle="modal" data-target="#editDishModal">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <!-- Repeat for each dish -->
            </tbody>
        </table>
    </div>

    <!-- Add Dish Modal -->
    <div class="modal fade" id="addDishModal" tabindex="-1" role="dialog" aria-labelledby="addDishModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDishModalLabel">Add New Dish</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="dishName">Dish Name</label>
                            <input type="text" class="form-control" id="dishName" placeholder="Enter dish name">
                        </div>
                        <div class="form-group">
                            <label for="category">Category</label>
                            <select class="form-control" id="category">
                                <option>Main Course</option>
                                <option>Appetizer</option>
                                <option>Dessert</option>
                                <!-- Add more categories as needed -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">Price ($)</label>
                            <input type="number" class="form-control" id="price" placeholder="Enter price">
                        </div>
                        <div class="form-group">
                            <label for="availability">Availability</label>
                            <select class="form-control" id="availability">
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="dishImage">Upload Image</label>
                            <input type="file" class="form-control-file" id="dishImage">
                        </div>
                        <button type="submit" class="btn btn-primary">Add Dish</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Dish Modal -->
    <div class="modal fade" id="editDishModal" tabindex="-1" role="dialog" aria-labelledby="editDishModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editDishModalLabel">Edit Dish</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="editDishName">Dish Name</label>
                            <input type="text" class="form-control" id="editDishName" value="Grilled Chicken">
                        </div>
                        <div class="form-group">
                            <label for="editCategory">Category</label>
                            <select class="form-control" id="editCategory">
                                <option>Main Course</option>
                                <option>Appetizer</option>
                                <option>Dessert</option>
                                <!-- Add more categories as needed -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="editPrice">Price ($)</label>
                            <input type="number" class="form-control" id="editPrice" value="12.99">
                        </div>
                        <div class="form-group">
                            <label for="editAvailability">Availability</label>
                            <select class="form-control" id="editAvailability">
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="editDishImage">Upload New Image</label>
                            <input type="file" class="form-control-file" id="editDishImage">
                        </div>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </form>
                </div>
            </div>
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
</body>
</html>
