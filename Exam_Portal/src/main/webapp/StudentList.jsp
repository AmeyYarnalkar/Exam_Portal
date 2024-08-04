<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="oes.model.*" %>
<%@ page import="oes.db.Students" %>
<%@ page import="java.util.ArrayList" %>
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
            color: #333;
        }

        h3 {
            color: #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #343a40;
            color: white;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Button Styles */
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container input {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-outline-success {
            background-color: #28a745;
        }

        .btn-outline-success:hover {
            background-color: #218838;
        }

        .btn-outline-danger {
            background-color: #dc3545;
        }

        .btn-outline-danger:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body>
    <center>
        <h3>List of All Students</h3>
    </center>
    <table>
        <thead>
            <tr>
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
                int i = 1; // Initialize counter from 1
                ArrayList<Students> allstudents = StudentsDao.getAllRecords();
                for (Students e : allstudents) {
            %>
            <tr>
                <td><%= i++ %></td>
                <td><%= e.getUsername() %></td>
                <td><%= e.getName() %></td>
                <td><%= e.getPassword() %></td>
                <td><a href="updatestudent.jsp?username=<%= e.getUsername() %>">Update</a></td>
                <td><a href="deletestudent.jsp?username=<%= e.getUsername() %>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <div class="button-container">
        <input type="button" value="Add Student" class="btn btn-outline-success" onclick="location.href='AddStudent.jsp'">
        <input type="button" value="Back to Panel" class="btn btn-outline-danger" onclick="location.href='AdminPanel.jsp'">
    </div>
</body>

</html>
