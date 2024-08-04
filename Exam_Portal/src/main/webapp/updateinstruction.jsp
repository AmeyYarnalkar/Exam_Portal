<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="oes.model.InstructionsDao"%>
<%@page import="oes.db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Instructions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
            color: white;
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
            <tr class="table-dark">
                <th>Sl No.</th>
                <th>Instruction</th>
                <th>Operation</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 1;
                ArrayList<Instructions> allInsts = InstructionsDao.getAllRecords();
                for (Instructions e : allInsts) {
                    boolean isEditing = request.getParameter("inst") != null && request.getParameter("inst").equals(e.getInstruction());
            %>
            <tr class="<%= isEditing ? "table-primary" : "" %>">
                <% if (isEditing) { %>
                    <form action="UpdateInstruction" method="post">
                        <input type="hidden" value="<%= e.getInstruction() %>" name="instoriginal">
                        <td><%= i++ %></td>
                        <td><input type="text" value="<%= e.getInstruction() %>" name="instmodified"></td>
                        <td><input type="submit" value="Update" class="btn btn-outline-primary"></td>
                        <td><a href="deleteinstruction.jsp?inst=<%= e.getInstruction() %>" class="btn btn-outline-danger">Delete</a></td>
                    </form>
                <% } else { %>
                    <td><%= i++ %></td>
                    <td><%= e.getInstruction() %></td>
                    <td><a href="updateinstruction.jsp?inst=<%= e.getInstruction() %>" class="btn btn-outline-primary">Update</a></td>
                    <td><a href="deleteinstruction.jsp?inst=<%= e.getInstruction() %>" class="btn btn-outline-danger">Delete</a></td>
                <% } %>
            </tr>
            <%
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
