<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="oes.model.StudentsDao"%>
<%@ page import="oes.model.InstructionsDao"%>
<%@ page import="oes.db.Instructions"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Merriweather|Roboto&display=swap" rel="stylesheet">
    <meta charset="ISO-8859-1">
    <title>Student Instructions</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #f0ad4e;
            padding: 20px;
            text-align: center;
            color: #fff;
        }
        .header h2 {
            margin: 0;
        }
        .container {
            margin-top: 20px;
        }
        .table {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table thead th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .btn-custom {
            margin: 5px;
            border-radius: 25px;
            padding: 10px 20px;
        }
        .btn-custom-logout {
            background-color: #dc3545;
            color: white;
        }
        .btn-custom-start {
            background-color: #28a745;
            color: white;
        }
        .text-center-custom {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <% 
        String name = StudentsDao.getStudentName(session.getAttribute("username").toString());
    %> 

    <div class="header">
        <h2>Welcome, <%= name %></h2>
    </div>

    <div class="container">
        <h4 class="text-center text-danger mb-4">Instructions to Students</h4>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Instruction</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;
                    ArrayList<Instructions> allInsts = InstructionsDao.getAllRecords();
                    for (Instructions e : allInsts) {
                %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= e.getInstruction() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div class="text-center-custom">
            <button type="button" class="btn btn-custom btn-custom-logout" onclick="location.href='oes.controller.LogoutStudent'">Logout</button>
            <button type="button" class="btn btn-custom btn-custom-start" onclick="location.href='Exam.jsp'">Start Test</button>
        </div>
    </div>

</body>
</html>
