<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.navbar {
	background: rgb(2 12 14/ 88%);
	padding: 7px 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 7px 50px;
	display: flex;
	justify-content: space-between;
	display: flex;
	justify-content: space-between;
}

.logo {
	color: #07b6c9;
	text-decoration: none;
	font-family: cursive;
	font-size: 20px;
	font-weight: lighter;
}

.nav-buttons {
	display: flex;
	gap: 20px;
}

.nav-buttons {
	display: flex;
	gap: 20px;
}

.nav-btn {
	color: #07b6c9;
	text-decoration: none;
	padding: 8px 15px;
	border: 1px solid #0e5a63;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.nav-btn:hover {
	background-color: #0a4740;
	color: #1bada8;
}

.container {
	display: flex;
	justify-content: center;
	background-color: #112829;
	align-items: center;
	flex-direction: column;
	background-color: #192e2f;
	align-items: center;
	height: 95vh;
}

.note-form {
	background-color: rgb(0, 29, 35);
	/* border: 1px solid #ddd; */
	padding: 20px;
	border-radius: 8px;
	width: 435px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	border-radius: 8px;
	width: 435px;
}

.note-form h2 {
	text-align: center;
	color: #92929d;
	margin-bottom: 20px;
}

.note-form label {
	color: #a1a0a0;
	font-weight: bold;
	display: block;
	margin-top: 10px;
}

input, textarea {
	width: 100%;
	padding: 1rem;
	border: 2px solid #ddd;
	border-radius: 6px;
	font-size: 1rem;
	transition: all 0.3s ease;
}

input:focus, textarea:focus {
	outline: none;
	border-color: #764ba2;
	box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
}

.note-form input[type="text"], .note-form input[type="email"] {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.note-form button {
	width: 100%;
	padding: 10px;
	margin-top: 20px;
	background-color: #0a5c63;
	color: wheat;
	border: none;
	font-size: 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.note-form button:hover {
	background-color: #0c6b6a;
}
/* Footer */
.footer {
	background-color: #23131391;
	text-align: center;
	color: white;
	padding: 15px;
	position: fixed;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<body>
	<!-- java codes -->
	<%
	User us = (User) session.getAttribute("logedUser");
	if (us != null) {
	%>
	<!-- java codes -->
	<div class="navbar">
		<a href="index.jsp" class="logo">E-Notes</a>
	</div>
	<div class="container">
		<div class="note-form">
			<h2>Edit User</h2>
			<form action="UpdateUserProfile" method="post">
				<input type="hidden" id="id" name="id" value="<%=us.getId()%>"
					required> <label for="name">Name</label> <input type="text"
					id="name" name="name" value="<%=us.getName()%>" required> <label
					for="age">Age</label> <input type="text" id="age" name="age"
					value="<%=us.getAge()%>" required> <label for="mobile">Mobile</label>
				<input type="text" id="mobile" name="mobile"
					value="<%=us.getMobile()%>" required>
					<!-- <label for="email">Email</label> -->
				<input type="hidden" id="email" name="email"
					value="<%=us.getEmail()%>" required>
					<input type="hidden" id="password" name="password"
					value="<%=us.getPassword()%>" required>

				<button type="submit">Save Edit</button>
				<a href="HomePage.jsp"><button type="button">Go Back</button></a>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<div class="footer">
		<p>&copy; 2024 eNotes. All rights reserved.</p>
	</div>
	<!-- java codes -->
	<%
	} else {
	response.sendRedirect("Login.jsp");
	}
	%>
	<!-- java codes -->
</body>
</html>
