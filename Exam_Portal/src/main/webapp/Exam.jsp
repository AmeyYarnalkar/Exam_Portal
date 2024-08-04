<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="oes.model.QuestionsDao"%>
<%@ page import="oes.db.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Examination</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
            max-width: 900px;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .timer {
            font-size: 1.2rem;
            color: #28a745;
            font-weight: bold;
        }
        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table thead th {
            background-color: #007bff;
            color: #fff;
        }
        .btn-custom {
            margin-top: 20px;
        }
        .btn-custom-submit {
            background-color: #28a745;
            color: white;
        }
        .btn-custom-submit:hover {
            background-color: #218838;
        }
    </style>
    <script>
        <%
            String clock = request.getParameter("clock");
            if (clock == null)
                clock = "120";
        %>
        var timeout = <%=clock %>;
        function timer() {
            if (timeout > 0) {
                timeout--;
                document.getElementById('clock').value = timeout;
                setTimeout(timer, 1000);
            } else {
                document.forms['formb'].submit();
            }
        }
    </script>
</head>
<body onload="timer()">
    <div class="container">
        <div class="header">
            <h1>Examination</h1>
        </div>

        <form name="formb" action="Result.jsp" method="post">
            <div class="form-group">
                <label class="timer">Time Left: <input type="text" id="clock" value="<%=clock%>" class="form-control-plaintext" readonly></label>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Sl No.</th>
                        <th>Question</th>
                        <th>Option A</th>
                        <th>Option B</th>
                        <th>Option C</th>
                        <th>Option D</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i = 1;
                        int radioName = 0;
                        ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
                        for (Questions e : allQuestions) {
                    %>
                    <tr>
                        <td><%=i++%></td>
                        <td><%=e.getQuestion() %></td>
                        <td><input type="radio" name="question<%=radioName%>" value="a"> <%=e.getA()%></td>
                        <td><input type="radio" name="question<%=radioName%>" value="b"> <%=e.getB()%></td>
                        <td><input type="radio" name="question<%=radioName%>" value="c"> <%=e.getC()%></td>
                        <td><input type="radio" name="question<%=radioName%>" value="d"> <%=e.getD()%></td>
                    </tr>
                    <%
                        radioName++;
                        }
                    %>
                </tbody>
            </table>

            <div class="text-center">
                <button type="submit" class="btn btn-custom btn-custom-submit btn-lg">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
