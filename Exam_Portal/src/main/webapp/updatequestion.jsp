<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="oes.model.*" %>
<%@ page import="oes.db.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of All Questions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f8f9fa;
        }
        h3 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }
        .table {
            background-color: #ffffff;
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
            background-color: #e9ecef;
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
    <h3>List of All Questions</h3>
    <table class="table table-bordered table-hover">
        <thead>
            <tr class="table-dark">
                <th>Sl No.</th>
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
                int i = 1;
                ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
                for (Questions e : allQuestions) {
                    if (request.getParameter("ques") != null && request.getParameter("ques").equals(e.getQuestion())) {
            %>
            <tr class="table-primary">
                <form action="updatequestionnow.jsp" method="post">
                    <input type="hidden" name="quesoriginal" value="<%= e.getQuestion() %>">
                    <td><%= i++ %></td>
                    <td><input type="text" name="quesmodified" value="<%= e.getQuestion() %>" class="form-control"></td>
                    <td><input type="text" name="opta" value="<%= e.getA() %>" class="form-control"></td>
                    <td><input type="text" name="optb" value="<%= e.getB() %>" class="form-control"></td>
                    <td><input type="text" name="optc" value="<%= e.getC() %>" class="form-control"></td>
                    <td><input type="text" name="optd" value="<%= e.getD() %>" class="form-control"></td>
                    <td><input type="text" name="ans" value="<%= e.getAnswer() %>" class="form-control"></td>
                    <td><input type="submit" value="Update" class="btn btn-outline-primary"></td>
                    <td><a href="deletequestion.jsp?ques=<%= e.getQuestion() %>" class="btn btn-outline-danger">Delete</a></td>
                </form>
            </tr>
            <%
                    } else {
            %>
            <tr>
                <td><%= i++ %></td>
                <td><%= e.getQuestion() %></td>
                <td><%= e.getA() %></td>
                <td><%= e.getB() %></td>
                <td><%= e.getC() %></td>
                <td><%= e.getD() %></td>
                <td><%= e.getAnswer() %></td>
                <td><a href="updatequestion.jsp?ques=<%= e.getQuestion() %>" class="btn btn-outline-primary">Update</a></td>
                <td><a href="deletequestion.jsp?ques=<%= e.getQuestion() %>" class="btn btn-outline-danger">Delete</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <div class="text-center mt-4">
        <a href="AddQuestion.jsp" class="btn btn-outline-success">Add Question</a>
        <a href="AdminPanel.jsp" class="btn btn-outline-danger">Back to Panel</a>
    </div>
</body>
</html>
