<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Add Plans</title>
<link rel="stylesheet" href="registration.css">

</head>
<body>
	<div class="wrapper">
		<h2>Add Plans</h2>

		<form action="AddPlanServlet" method="post">
			<div class="input-box">
				<label for="planName">Plan Name:</label> <input type="text"
					name="planName" required><br>
			</div>
			<div class="input-box">
			<label for="specification1">Specification 1:</label> <input
				type="text" name="specification1" required><br>
				</div>
			<div class="input-box">
				<label for="specification2">Specification 2:</label> <input
					type="text" name="specification2" required><br>
			</div>
			<div class="input-box">
			<label for="duration">Duration:</label> <select name="duration"
				required>
				<option value="3 months">3 months</option>
				<option value="6 months">6 months</option>
				<option value="12 months">12 months</option>
			</select><br>
			</div>
			<div class="input-box">
				<label for="price">Price:</label> <input type="text" name="price"
					required><br>
			</div>
			 <button type="submit" class="btn">Add Plan</button>
            <div class="register-link">
                <p><a href="admin_dashboard.jsp">Back to home page</a></p>
            </div>
		</form>
	</div>
</body>
</html>
