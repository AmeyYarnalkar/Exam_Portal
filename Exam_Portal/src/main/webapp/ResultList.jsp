<%@page import="oes.db.Result"%>
<%@ page import="oes.model.ResultDao" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Student Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .results-table {
            margin-top: 20px;
        }
        .result-value {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>All Student Results</h1>
</div>

<div class="container">
    <table class="table table-hover results-table">
        <thead>
            <tr class="table-warning">
                <th>Student ID</th>
                <th>Total Number of Questions</th>
                <th>Number of Questions Attempted</th>
                <th>Number of Correct Answers</th>
                <th>Number of Wrong Answers</th>
                <th>Number of Unattempted Questions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Fetch results from the DAO
                List<Result> resultsList = ResultDao.getAllStudentResults();
                
                // Check if the results list is not null and has elements
                if (resultsList != null && !resultsList.isEmpty()) {
                    for (Result result : resultsList) {
            %>
            <tr>
                <td><%= result.getUsername()%></td>
                <td class="result-value"><%= result.getTotalQuestions() %></td>
                <td class="result-value"><%= result.getAttempted() %></td>
                <td class="result-value text-success"><%= result.getCorrectAnswers() %></td>
                <td class="result-value text-danger"><%= result.getWrongAnswers() %></td>
                <td class="result-value"><%= result.getUnattempted()%></td>
            </tr>
            <% 
                    }
                } else { 
            %>
            <tr>
                <td colspan="6" class="text-center">No results available</td>
            </tr>
            <% 
                } 
            %>
        </tbody>
    </table>
</div>

</body>
</html>
