<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #333;
        }

        .navbar-nav li a {
            color: white;
            text-align: center;
        }

        .navbar-nav li a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            max-width: 400px;
            margin-top: 50px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            border-radius: 0.25rem;
        }

        .btn-primary {
            width: 100%;
            margin-top: 10px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Student Portal</a>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.html">Home</a>
            </li>
            <!-- Add more links if needed -->
        </ul>
    </nav>

    <!-- Login Form -->
    <div class="container">
        <div class="login-header">
            <h1 class="text-primary">Student Login</h1>
        </div>
        <!-- Error/Sucess Messages -->
        <%
            String msg = request.getParameter("msg");
            String msg1 = request.getParameter("msg1");
            if (msg != null) {
        %>
        <div class="alert alert-danger">
            <%= msg %>
        </div>
        <% } %>
        <% if (msg1 != null) { %>
        <div class="alert alert-success">
            <%= msg1 %>
        </div>
        <% } %>

        <!-- Form -->
        <form action="oes.controller.ValidateStudent" method="post">
            <div class="form-group">
                <label for="uname">User ID</label>
                <input type="text" class="form-control" id="uname" name="uname" required>
            </div>
            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" class="form-control" id="pass" name="pass" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <a href="index.html" class="btn btn-secondary">Exit</a>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
