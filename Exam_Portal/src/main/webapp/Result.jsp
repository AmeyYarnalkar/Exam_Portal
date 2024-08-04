<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="oes.db.Questions"%>
<%@ page import="oes.model.QuestionsDao"%>
<%@ page import="java.util.ArrayList"%>
<%@page  import="oes.controller.StudentResults" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Exam Results</title>
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
        .btn-custom {
            margin-top: 20px;
        }
        .btn-custom-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-custom-danger:hover {
            background-color: #c82333;
        }
        .result-value {
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    // Retrieve all questions and their correct answers from the database
    ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
    int size = allQuestions.size();
    
    String[] dbAnswers = new String[size];
    String[] userAnswers = new String[size];
    
    int i = 0;
    for (Questions question : allQuestions) {
        dbAnswers[i] = question.getAnswer();
        // Retrieve user answers using the question index as the parameter name
        userAnswers[i] = request.getParameter("question" + i);
        i++;
    }
    
    // Initialize counters for correct, wrong, and unattempted answers
    int correctAnswers = 0;
    int unattempted = 0;
    int wrongAnswers = 0;
    
    for (int j = 0; j < size; j++) {
        String userAnswer = userAnswers[j];
        String correctAnswerDb = dbAnswers[j];
        
        // Handle null values to prevent NullPointerException
        if (userAnswer == null) {
            unattempted++;
        } else if (userAnswer.equalsIgnoreCase(correctAnswerDb)) {
            correctAnswers++;
        } else {
            wrongAnswers++;
        }
    }
    
    int attempted = size - unattempted;
    String username = (String) session.getAttribute("username");
    if (username == null) {
        username = "Unknown";
    }
%>

<div class="header">
    <h1>Results</h1>
</div>

<div class="container">
    <!-- Results Summary -->
    <table class="table table-hover results-table">
        <thead>
            <tr class="table-warning">
                <th colspan="3" class="text-center">
                    <h4>Name: <%=session.getAttribute("name") != null ? session.getAttribute("name") : "Guest" %> || User ID: <%= username %></h4>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Total Number of Questions</td>
                <td class="result-value"><%= size %></td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Number of Questions Attempted</td>
                <td class="result-value"><%= attempted %></td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Number of Correct Answers</td>
                <td class="result-value text-success"><%= correctAnswers %></td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>Number of Wrong Answers</td>
                <td class="result-value text-danger"><%= wrongAnswers %></td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>Number of Unattempted Questions</td>
                <td class="result-value"><%= unattempted %></td>
            </tr>
        </tbody>
    </table>

    <!-- Form to Save Results -->
    <form action="StudentResults" method="post">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="hidden" name="size" value="<%= size %>">
        <input type="hidden" name="attempted" value="<%= attempted %>">
        <input type="hidden" name="correctAnswers" value="<%= correctAnswers %>">
        <input type="hidden" name="wrongAnswers" value="<%= wrongAnswers %>">
        <input type="hidden" name="unattempted" value="<%= unattempted %>">

        <div class="text-center">
            <button type="submit" class="btn btn-custom btn-success btn-lg">Save Results</button>
            <a href="oes.controller.LogoutStudent" class="btn btn-custom btn-custom-danger btn-lg">Exit</a>
        </div>
    </form>
</div>

</body>
</html>
