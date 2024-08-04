<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e9ecef;
            color: #333;
        }

        /* Header */
        .header {
            height: 200px;
            width: 100%;
            background: linear-gradient(135deg, #6e45e2, #88d3ce);
            display: flex;
            justify-content: center;
            align-items: center;
            border-bottom: 4px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            color: white;
            font-weight: 700;
            font-size: 2.5rem;
            margin: 0;
        }

        /* Buttons */
        .button-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 40px 0;
        }

        .button-container input {
            padding: 15px 25px;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 8px;
            color: white;
            background-color: #28a745;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
        }

        .button-container input:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        /* Centered Container */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Content Paragraphs */
        .content {
            text-align: center;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .content p {
            font-size: 1.1rem;
            color: #555;
        }
    </style>
</head>

<body>
    <% if (session.getAttribute("username") != null) {
        // User is logged in
    } else {
        String msg2 = "Please Login as Admin to Continue";
        response.sendRedirect("AdminLogin.jsp?msg2=" + msg2);
    } %>

    <div class="header">
        <h1>Welcome <%= session.getAttribute("username") %></h1>
    </div>

    <div class="container">
        <div class="content">
            <p>Welcome to the Admin Panel. Here you can manage the system's content effectively.</p>
            <p>Use the buttons below to navigate through various administrative tasks. Ensure that all entries are up to date and correct for smooth operation of the system.</p>
            <p>Your actions are crucial in maintaining the system's integrity and reliability.</p>
        </div>
        <div class="button-container">
            <input onclick="location.href='StudentList.jsp';" type="button" value="Add/Update Student">
            <input onclick="location.href='InstructionList.jsp';" type="button" value="Add/Update Instructions">
            <input onclick="location.href='QuestionList.jsp'" type="button" value="Add/Update Question">
            <input onclick="location.href='ResultList.jsp'" type="button" value="View Student Result">
            <input onclick="location.href='oes.controller.LogoutAdmin'" type="button" value="Logout">
        </div>
    </div>
</body>

</html>
