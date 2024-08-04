<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="oes.model.InstructionsDao"%>
<%@page import="oes.db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Instructions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
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

        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tr:hover {
            background-color: #e0e0e0;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            color: black;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
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
    </style>
</head>

<body>
    <h3>List of All Instructions</h3>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Sl No.</th>
                <th>Instruction</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Instructions> allInsts = InstructionsDao.getAllRecords();
                if (allInsts.isEmpty()) {
            %>
            <tr>
                <td colspan="4" class="text-center">No instructions available.</td>
            </tr>
            <%
                } else {
                    int i = 1;
                    for (Instructions e : allInsts) {
            %>
            <tr>
                <td><%= i++ %></td>
                <td><%= e.getInstruction() %></td>
                <td><a href="updateinstruction.jsp?inst=<%= e.getInstruction() %>" class="btn btn-outline-primary">Update</a></td>
                <td><a href="deleteinstruction.jsp?inst=<%= e.getInstruction() %>" class="btn btn-outline-danger">Delete</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <div class="text-center mt-4">
        <a href="AddInstruction.jsp" class="btn btn-outline-success">Add Instruction</a>
        <a href="AdminPanel.jsp" class="btn btn-outline-danger">Back to Panel</a>
    </div>
</body>

</html>
