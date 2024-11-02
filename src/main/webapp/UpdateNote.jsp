<%@page import="com.org.dto.Notes"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Notes</title>
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

input , textarea {
	width: 100%;
	padding: 1rem;
	border: 2px solid #ddd;
	border-radius: 6px;
	font-size: 1rem;
	transition: all 0.3s ease;
}

input:focus , textarea:focus {
	outline: none;
	border-color: #764ba2;
	box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
}

.note-form input[type="text"], .note-form textarea {
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
	color:white;
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
		<div class="nav-buttons">
			<a href="index.jsp" class="nav-btn">Home</a>
		</div>
	</div>
	<div class="container">
		<div class="note-form">
			<h2>Add New Note</h2>
			<!-- java codes -->
			<%
			//adding user to fetch note details
			Notes notes = (Notes) session.getAttribute("noteUpdate");
			/* List<Notes> nt = fd.getNotes(); */
			if (notes != null) {
				/* for (Notes notes : nt) { */
			%>
			<!-- java codes -->
			<form action="updateAddNote" method="post">
				<input type="hidden" name="id2" value="<%=notes.getId()%>">
				<label for="title">Title</label> <input type="text" id="title"
					name="title" value="<%=notes.getTitle()%>" required> <label
					for="content">Description </label>
				<p style="color: red; font-size: 13px;">( Warning : Description
					length shouldn't be greater then 1000 )</p>
				<textarea id="content" name="description" rows="6" maxlength="980"
					required><%=notes.getDescription()%></textarea>

				<button type="submit">Edit Note</button>
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
	}
	} else {
	// If user is not logged in, redirect to the Login page
	response.sendRedirect("Login.jsp");
	}
	%>
	<!-- java codes -->
</body>
</html>