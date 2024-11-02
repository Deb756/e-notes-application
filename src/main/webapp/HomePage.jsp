<%@page import="com.org.dto.Notes"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
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

.nav-btn2 {
	width: 100%;
	text-decoration: none;
	padding: 1rem;
	background: linear-gradient(to right, #593333, #1e2a45);
	border: none;
	border-radius: 6px;
	color: white;
	font-size: 1.1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	margin-bottom: 1rem;
	padding: 1rem;
}

.nav-btn2:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.profile-btn {
	color: #07b6c9;
	background-color: #07b6c900;
	border: none;
}

.profile-btn:hover {
	background-color: #ff000000;
}

.profile-menu {
	background-color: #ffffff00;
	color: #07b6c9;
	padding: 7px;
	font-weight: lighter;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	font-weight: lighter;
	width: 23vw;
}

.containerr {
	display: flex;
	justify-content: center;
	background-color: #112829;
	align-items: center;
	flex-direction: column;
	background-color: #192e2f;
	align-items: center;
	min-height: 95vh;
}

.contAllNote {
	display: flex;
	align-items: center;
	justify-content: center;
	/* gap: 9px; */
	flex-wrap: wrap;
	width: 90%;
	margin-bottom: 70px;
}

.contAdd {
	margin: 40px;
}

/* Card styling */
.note-card {
	background-color: rgb(0, 29, 35);
	/* border: 1px solid #ddd; */
	border-radius: 8px;
	padding: 20px;
	margin: 15px;
	width: 79%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	position: relative;
}

.note-card:hover {
	transform: translateY(-5px);
}

.note-title {
	font-size: 20px;
	color: #086d9f;
	font-weight: bold;
	margin-bottom: 10px;
}

.note-description {
	color: wheat;
	background-color: #abf33229;
	margin-bottom: 40px;
	padding: 10px;
	border-radius: 6px;
	line-height: 1.5;
	margin-bottom: 40px;
	padding: 10px;
	border-radius: 6px;
}

/* Button styling */
.card-buttons {
	display: flex;
	position: absolute;
	bottom: 15px;
	right: 15px;
	position: absolute;
	bottom: 15px;
	bottom: 15px;
}

.card-btn {
	background-color: #50465b;
	color: #fff;
	border: none;
	padding: 8px 12px;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
	transition: background-color 0.3s ease;
}

.card-btn:hover {
	background-color: #5a378a;
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
	<!-- JAVA CODE -->
	<%
	User logUs = (User) session.getAttribute("logedUser");
	if (logUs == null) {
		response.sendRedirect("Login.jsp");
	}
	User updateUs = (User) session.getAttribute("updateUser");
	List<Notes> notes = null;
	%>
	<!-- JAVA CODE -->
	<div class="navbar">
		<a href="index.jsp" class="logo">E-Notes</a>
		<div class="nav-buttons">
			<div class="btn-group">
				<button class="btn btn-secondary btn-sm dropdown-toggle profile-btn"
					type="button" data-bs-toggle="dropdown" aria-expanded="false">
					<%=updateUs == null ? logUs.getName() : updateUs.getName()%>
					😁
				</button>
				<ul class="dropdown-menu profile-menu">
					<p>
						Age :
						<%=updateUs == null ? logUs.getAge() : updateUs.getAge()%></p>
					<p>
					<p>
						Email :
						<%=updateUs == null ? logUs.getEmail() : updateUs.getEmail()%></p>
					<p>
						Mobile :
						<%=updateUs == null ? logUs.getMobile() : updateUs.getMobile()%></p>
					<form action="EditUser" method="post">
						<input type="hidden" name="us_id" value="<%=logUs.getId()%>">
						<button type="submit" class="nav-btn"
							style="background-color: #ff000000; float: right;">Edit</button>
						<!-- <a href="EditUser" class="nav-btn" style="float: right;">Edit</a> -->
					</form>
				</ul>
			</div>
			<a href="index.jsp" class="nav-btn">Home</a> <a href="Logout"
				class="nav-btn">Logout</a>
		</div>
	</div>
	<div class="containerr">
		<div class="contAdd">
			<a href="AddNote.jsp" class="nav-btn2">Add New Notes</a>
			<%
			User addNt = (User) session.getAttribute("noteSaved");
			%>
		</div>

		<div class="contAllNote">
			<!-- java code -->
			<%
			if (addNt == null) {
				notes = logUs.getNotes();
			} else {
				notes = addNt.getNotes();
			}
			if (notes != null) {
				for (Notes nt : notes) {
			%>
			<!-- java code -->
			<div class="note-card">
				<div class="note-title"><%=nt.getTitle()%></div>
				<hr style="margin-bottom: 11px; color: ghostwhite;">
				<div class="note-description"><%=nt.getDescription()%></div>
				<div class="card-buttons">
					<form action="EditNote" method="post">
						<input type="hidden" name="id" value="<%=nt.getId()%>">
						<button type="submit" class="card-btn">Edit</button>
					</form>
					<form action="deleteNote" method="post">
						<input type="hidden" name="id2" value="<%=nt.getId()%>">
						<button class="card-btn">Delete</button>
					</form>
				</div>
			</div>
			<%
			}
			} else {
			response.sendRedirect("Login.jsp");
			}
			%>
		</div>
	</div>

	<!-- Footer -->
	<div class="footer">
		<p>&copy; 2024 eNotes. All rights reserved.</p>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
</html>

