<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="animatedBack.css">
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
	background: rgb(1 20 24/ 88%);
	padding: 8px 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 1000;
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
	border: 2px solid #103337;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.nav-btn:hover {
	background-color: #0a4740;
	color: #1bada8;
}

/* html, body {
    height: 100%;
    overflow-y: auto; /* or overflow-y: scroll 
} */
body {
	/* background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); */
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 80px;
	overflow-y: auto;
}

.mainCont {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}

#autoDismissAlert {
	position: relative;
	top: -19px;
	width: 93%;
}

.container {
	background: rgb(0, 29, 35);
	padding: 2.5rem;
	border-radius: 10px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
	width: 100%;
	max-width: 400px;
	margin-bottom: 12px;
}

.logoCir {
	display: grid;
	place-content: center;
}

.logo-circle {
	width: 70px;
	height: 70px;
	background: linear-gradient(to right, #17514b, #1f3a53);
	border-radius: 50%;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 1rem;
}

h2 {
	color: #c9c5c5;
	text-align: center;
	margin-bottom: 2rem;
	font-size: 2rem;
}

.login-error {
	color: #ff0000;
	text-align: center;
	margin-bottom: 1rem;
	font-size: 0.9rem;
	font-weight: 500;
}

.form-group {
	margin-bottom: 1.5rem;
}

label {
	display: block;
	margin-bottom: 0.5rem;
	color: #a1a0a0;
	font-weight: 500;
}

input {
	width: 100%;
	padding: 1rem;
	border: 2px solid #ddd;
	border-radius: 6px;
	font-size: 1rem;
	transition: all 0.3s ease;
}

input:focus {
	outline: none;
	border-color: #764ba2;
	box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
}

button {
	width: 100%;
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
}

button:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.forgot-password {
	text-align: center;
	margin-bottom: 1.5rem;
}

.forgot-password a, .register-link a {
	color: #764ba2;
	text-decoration: none;
	transition: color 0.3s ease;
}

.forgot-password a:hover, .register-link a:hover {
	color: #667eea;
}

.register-link {
	text-align: center;
	color: #666;
	font-size: 0.9rem;
}
/* Footer */
.footer {
	background-color: #23131391;
	text-align: center;
	padding: 15px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

@media ( max-width : 480px) {
	.container {
		margin: 1rem;
		padding: 1.5rem;
	}
}
</style>
</head>
<body>
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
	<%
	String errorMsg = (String) session.getAttribute("msg");
	if (errorMsg != null) {
	%>
	<div class="mainCont">
		<!-- aleart -->
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert" id="autoDismissAlert">
			<strong>Login Failed</strong> Invalid Credentials
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		session.removeAttribute("msg");
		}
		%>

		<div class="container">
			<div class="logoCir">
				<div class="logo-circle">👤</div>
			</div>
			<h2>Welcome Back</h2>

			<form action="Login" method="post">
				<div class="form-group">
					<label for="email">Email Address</label> <input type="email"
						id="email" name="email" required>
				</div>

				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						id="password" name="password" required>
				</div>

				<div class="forgot-password">
					<a href="ForgotPassword.jsp">Forgot your password?</a>
				</div>

				<button type="submit">Log In</button>

				<div class="register-link">
					Don't have an account? <a href="Registraion.jsp">Sign Up</a>
				</div>
			</form>
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
			 alertElement.style.display = "none";
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
