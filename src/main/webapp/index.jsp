<%@page import="com.org.utilities.Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="animatedBack.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>eNotes - Take Notes Online</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

/* Navbar Styles */
.navbar {
	background-color: rgb(1 20 24/ 88%);
	padding: 8px 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
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

/* Main Content Styles */
.main-content {
	padding: 50px;
	text-align: center;
}

.main-title {
	font-size: 36px;
	color: #c3c3c3;
	margin-bottom: 20px;
}

.main-subtitle {
	font-size: 18px;
	color: #adbd9f;
	margin-bottom: 50px;
}

/* Feature Cards */
.features {
	display: flex;
	justify-content: center;
	gap: 30px;
	flex-wrap: wrap;
	padding: 20px;
}

.feature-card {
	background-color: rgb(0, 29, 35);
	/* border: 1px solid #ddd; */
	border-radius: 8px;
	padding: 20px;
	width: 300px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.feature-card:hover {
	transform: translateY(-5px);
}

.feature-title {
	font-size: 20px;
	color: #00796b;
	margin-bottom: 10px;
}

.feature-text {
	color: #666;
	line-height: 1.5;
}

/* Footer */
.footer {
	background-color: #23131391;
	text-align: center;
	padding: 20px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
	.navbar {
		padding: 15px 20px;
		flex-direction: column;
		gap: 15px;
	}
	.nav-buttons {
		width: 100%;
		justify-content: center;
	}
	.main-content {
		padding: 30px 20px;
	}
	.main-title {
		font-size: 28px;
	}
	.feature-card {
		width: 100%;
		max-width: 300px;
	}
}
</style>
</head>
<body>
	<%
	    Helper.getEMF();
	%>
	<!-- <h1>Welcome to the e-notes-Project</h1> -->
	<!-- animated background -->
	<div class="background">
		<div class="shape rectangle"></div>
		<div class="shape circle"></div>
		<div class="shape triangle"></div>
		<div class="shape diamond"></div>
		<div class="shape hexagon"></div>
		<div class="shape star"></div>
		<div class="shape rectangle"></div>
		<div class="shape circle"></div>
		<div class="shape triangle"></div>
		<div class="shape diamond"></div>
		<div class="shape hexagon"></div>
		<div class="shape star"></div>
		<div class="shape rectangle"></div>
		<div class="shape circle"></div>
		<div class="shape triangle"></div>
		<div class="shape diamond"></div>
		<div class="shape hexagon"></div>
		<div class="shape star"></div>
		<div class="shape diamond"></div>
		<div class="shape hexagon"></div>
	</div>
	<!-- animated background -->

	<div class="navbar">
		<a href="index.jsp" class="logo">E-Notes</a>
		<div class="nav-buttons">
			<a href="index.jsp" class="nav-btn">Home</a> <a href="Login.jsp"
				class="nav-btn">Login</a> <a href="Registraion.jsp" class="nav-btn">Register</a>
		</div>
	</div>
	<!-- aleart -->
	<div class="alert alert-success alert-dismissible fade show"
		role="alert" id="autoDismissAlert">
		<strong>Welcome to eNotes </strong> Have a grate exploration
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<h1 class="main-title">Welcome to eNotes</h1>
		<p class="main-subtitle">Your Digital Notebook for Seamless
			Note-Taking</p>

		<!-- Feature Cards -->
		<div class="features">
			<div class="feature-card">
				<h2 class="feature-title">Create Notes</h2>
				<p class="feature-text">Create and organize your notes
					efficiently with our user-friendly interface.</p>
			</div>

			<div class="feature-card">
				<h2 class="feature-title">Access Anywhere</h2>
				<p class="feature-text">Access your notes from any device,
					anytime, anywhere.</p>
			</div>

			<div class="feature-card">
				<h2 class="feature-title">Secure Storage</h2>
				<p class="feature-text">Your notes are securely stored and
					protected with us.</p>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div class="footer">
		<p>&copy; 2024 eNotes. All rights reserved.</p>
	</div>
</body>
<script>
	// Automatically dismiss the alert after 5 seconds (5000 ms)
	setTimeout(function() {
		let alertElement = document.getElementById("autoDismissAlert");
		if (alertElement) {
			alertElement.classList.remove("show"); // Hides the alert smoothly
		}
	}, 3000); // Adjust time as needed
</script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
</html>