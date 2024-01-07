<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="dashboard.css">
<title>Admin Page</title>

</head>
<body>
	<div class="admin-header">
		<h1>Greetings Admin!</h1>
	</div>
	<form action="add_plans" method="post">
		<div class="admin-container">
			<div class="admin-box">
				<a href="add_plans.jsp"><i class="fa-solid fa-square-plus fa-4x"></i></a><br>
				<br> <a href="add_plans.jsp">Add plans</a>
			</div>
			<div class="admin-box">
				<a href="all_plans.jsp"><i
					class="fa-sharp fa-solid fa-clipboard fa-4x"></i></a><br> <br>
				<a href="all_plans.jsp">All plans</a>
			</div>
			<div class="admin-box">
				<a href="all_bookings.jsp"><i
					class="fa-solid fa-pen-to-square fa-4x"></i></a><br> <br> <a
					href="all_bookings.jsp">All Orders</a>
			</div>
			<div class="admin-box">
				<a href="logout"><i class="fa-solid fa-right-from-bracket fa-4x"></i></a><br>
				<br> <a href="logout">Logout</a>
			</div>
		</div>
	</form>
	<section class="footer">
		<div class="footer-container container">
			<div class="footer-box"></div>
			<div class="footer-box">
				<h3>QuickNav</h3>
				<a href="index.jsp">Home</a> <a href="index.jsp#plans">Plans</a> <a
					href="index.jsp#contact ">Contact</a> <a href="about_us.jsp">About
					Us</a>
			</div>

		</div>
	</section>

</body>
</html>
