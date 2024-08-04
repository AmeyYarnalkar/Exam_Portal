<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link
	href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
	rel="stylesheet">
<style>
/* General Styles */
body {
	font-family: 'Calistoga', cursive;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	color: #333;
}

h1 {
	color: blue;
	text-align: center;
}

/* Navigation Styles */
.navbar {
	display: flex;
	justify-content: center;
	background-color: #333;
	padding: 14px 0;
	margin: 0;
}

.navbar a {
	color: white;
	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
	transition: background-color 0.3s ease;
}

.navbar a:hover {
	background-color: aqua;
}

/* Form Styles */
.form-container {
	width: 90%;
	max-width: 500px;
	margin: 50px auto;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-container label {
	display: block;
	margin: 10px 0 5px;
}

.form-container input[type="text"], .form-container input[type="password"]
	{
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.form-container .button-container {
	display: flex;
	gap: 10px;
}

.form-container input[type="button"], .form-container input[type="submit"]
	{
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	color: white;
	background-color: #007bff;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-container input[type="button"]:hover, .form-container input[type="submit"]:hover
	{
	background-color: #0056b3;
}

.messages {
	text-align: center;
	margin-bottom: 20px;
}

.messages p {
	margin: 0;
}

.messages .error {
	color: red;
}

.messages .success {
	color: green;
}
</style>
</head>

<body>
	<div class="navbar">
		<a href="#">Home</a> <a href="#">About</a> <a href="#">Contact</a>
	</div>

	<div class="messages">
		<%
		if (request.getParameter("msg2") != null) {
		%>
		<p class="error"><%=request.getParameter("msg2")%></p>
		<%
		}
		%>
		<%
		if (request.getParameter("msg1") != null) {
		%>
		<p class="success"><%=request.getParameter("msg1")%></p>
		<%
		}
		%>
	</div>

	<div class="form-container">
		<h1>Admin Login</h1>
		<form action="oes.controller.ValidateAdmin" method="post">
			<label for="uname">Username:</label> <input type="text" id="uname"
				name="uname" required> <label for="pass">Password:</label> <input
				type="password" id="pass" name="pass" required> <input
				onclick="location.href='index.html'" type="button" value="Exit">
			<input type="submit" value="Login">
		</form>
	</div>
</body>

</html>
