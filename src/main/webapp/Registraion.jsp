<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link rel="stylesheet" href="animatedBack.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
/* Global Styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Navbar Styles */
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
	border: 1px solid #0e5a63;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.nav-btn:hover {
	background-color: #0a4740;
	color: #1bada8;
}

/* Body and Container Adjustments */
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
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
	width: 100%;
	max-width: 480px;
	margin: 1rem auto;
}

.container form {
	display: flex;
	justify-content: center;
	flex-direction: column;
	gap: 13px;
}

h1 {
	color: #c9c5c5;
	text-align: center;
	margin-bottom: 1.5rem;
	font-size: 2rem;
}

.form-label {
	display: block;
	margin-bottom: 0.5rem;
	color: #a1a0a0;
	font-weight: 500;
}

input {
	width: 100%;
	padding: 0.8rem;
	border: 2px solid #ddd;
	border-radius: 6px;
	font-size: 1rem;
	transition: border-color 0.3s ease;
}

input:focus {
	outline: none;
	border-color: #764ba2;
}

.btn-reg {
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

.btn-reg:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
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
/* Media Query */
@media ( max-width : 480px) {
	.container {
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

	<!-- Navbar -->
	<div class="navbar">
		<a href="index.jsp" class="logo">E-Notes</a>
		<div class="nav-buttons">
			<a href="index.jsp" class="nav-btn">Home</a> <a href="Login.jsp"
				class="nav-btn">Login</a> <a href="Registraion.jsp" class="nav-btn">Register</a>
		</div>
	</div>

	<div class="mainCont">
		<!-- alert -->
		<%
		String alert = "<div class='alert alert-warning alert-dismissible fade show' role='alert' id='autoDismissAlert'>"
				+ "<strong>User Already Exist! </strong> Try Other Email id "
				+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>" + "</div>";
		%>
		<%
		String userExist = (String) session.getAttribute("userExist");
		if ("RegFailed".equalsIgnoreCase(userExist)) {
		%>
		<%=alert%>
		<%
		}
		session.removeAttribute("userExist");
		%>


		<div class="container">
			<h1>User Registration</h1>
			<form action="register" method="post">
				<div class="mb-3">
					<label for="inputName" class="form-label">User Name</label> <input
						type="text" class="form-control" id="inputName" name="name"
						placeholder="Enter your name" required>
				</div>

				<div class="mb-3">
					<label for="inputAge" class="form-label">User Age</label> <input
						type="number" class="form-control" id="inputAge" name="age"
						placeholder="Enter your age" required>
				</div>

				<div class="mb-3">
					<label for="inputMobile" class="form-label">User Mobile</label> <input
						type="tel" class="form-control" id="inputMobile" name="mobile"
						placeholder="Enter your mobile number" pattern="\d{10}"
						maxlength="10" required>
				</div>

				<div class="mb-3">
					<label for="inputEmail" class="form-label">User Email
						address</label> <input type="email" class="form-control" id="inputEmail"
						name="email" placeholder="Enter your email" required>
					<div id="emailHelp" class="form-text" style="color: gray;">We'll
						never share your email with anyone else.</div>
				</div>

				<div class="mb-3">
					<label for="inputPassword" class="form-label">User Password</label>
					<input type="password" class="form-control" id="inputPassword"
						name="password" placeholder="Enter your password" required>
				</div>

				<button type="submit" class="btn btn-primary btn-reg">Register</button>
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
