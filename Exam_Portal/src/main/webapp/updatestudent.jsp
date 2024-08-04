<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="oes.model.StudentsDao"%>
<%@page import="oes.db.Students"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Students</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h3 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

        .table-primary {
            background-color: #d6e9f9;
        }

        .table-dark {
            background-color: #343a40;
            color: white;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-outline-success {
            background-color: #28a745;
            border: 1px solid #28a745;
        }

        .btn-outline-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-outline-danger {
            background-color: #dc3545;
            border: 1px solid #dc3545;
        }

        .btn-outline-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .btn-outline-primary {
            background-color: #007bff;
            border: 1px solid #007bff;
        }

        .btn-outline-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .btn-container input {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
    </style>
</head>

<body>
    <h3>List of All Students</h3>
    <table>
        <thead>
            <tr class="table-dark">
                <th>Sl No.</th>
                <th>User ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 0;
                ArrayList<Students> allstudents = StudentsDao.getAllRecords();
                for (Students e : allstudents) {
                    if (request.getParameter("username") != null && request.getParameter("username").equals(e.getUsername())) {
            %>
            <tr class="table-primary">
                <form action="UpdateStudent" method="post">
                    <input type="hidden" value="<%= e.getUsername() %>" name="usernameoriginal">
                    <td><%= i++ %></td>
                    <td><input type="text" value="<%= e.getUsername() %>" name="uname"></td>
                    <td><input type="text" value="<%= e.getName() %>" name="name"></td>
                    <td><input type="text" value="<%= e.getPassword() %>" name="pass"></td>
                    <td><input type="submit" value="Update" class="btn btn-outline-primary"></td>
                    <td><a href="deletestudent.jsp?username=<%= e.getUsername() %>" class="btn btn-outline-danger">Delete</a></td>
                </form>
            </tr>
            <%
                    } else {
            %>
            <tr>
                <td><%= i++ %></td>
                <td><%= e.getUsername() %></td>
                <td><%= e.getName() %></td>
                <td><%= e.getPassword() %></td>
                <td><a href="updatestudent.jsp?username=<%= e.getUsername() %>" class="btn btn-outline-primary">Update</a></td>
                <td><a href="deletestudent.jsp?username=<%= e.getUsername() %>" class="btn btn-outline-danger">Delete</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <div class="btn-container">
        <input type="button" class="btn btn-outline-success" value="Add Student" onclick="location.href='AddStudent.jsp'">
        <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
    </div>
</body>

</html>
