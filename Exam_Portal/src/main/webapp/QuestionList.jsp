<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="oes.model.QuestionsDao"%>
<%@page import="oes.db.Questions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List of Questions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        /* Basic reset */
        body, h3, table, th, td {
            margin: 0;
            padding: 0;
            border: 0;
            box-sizing: border-box;
        }

        /* Font and background */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }

        h3 {
            margin: 20px 0;
            color: #007bff;
        }

        /* Table styles */
        .table {
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table thead th {
            background-color: #343a40;
            color: #ffffff;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

        /* Button styles */
        .btn {
            margin: 5px;
        }

        .btn-outline-success {
            color: #28a745;
            border-color: #28a745;
        }

        .btn-outline-success:hover {
            background-color: #28a745;
            color: #ffffff;
        }

        .btn-outline-danger {
            color: #dc3545;
            border-color: #dc3545;
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            color: #ffffff;
        }

        /* Centering */
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <center><h3>List of all questions</h3></center>
    <table class="table table-bordered table-hover">
        <thead>
            <tr class="table-dark">
                <th>sl no.</th>
                <th>Question</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Correct Answer</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 0;
                ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
                for(Questions e : allQuestions) {
            %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= e.getQuestion() %></td>
                    <td><%= e.getA() %></td>
                    <td><%= e.getB() %></td>
                    <td><%= e.getC() %></td>
                    <td><%= e.getD() %></td>
                    <td><%= e.getAnswer() %></td>
                    <td><a class="btn btn-outline-primary" href="updatequestion.jsp?ques=<%= e.getQuestion() %>">Update</a></td>
                    <td><a class="btn btn-outline-danger" href="deletequestion.jsp?ques=<%= e.getQuestion() %>">Delete</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <div class="center">
        <input type="button" class="btn btn-outline-success" value="Add Question" onclick="location.href='AddQuestion.jsp'">
        <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
    </div>
</body>
</html>
