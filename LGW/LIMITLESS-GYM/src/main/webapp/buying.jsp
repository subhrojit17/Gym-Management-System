<%@page import="com.entity.PlanDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page import="com.dao.*"%>
<%@page import="java.awt.print.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.DB.ConnectionProvider"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Plan List</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Caveat&family=Josefin+Sans:wght@600&family=Libre+Baskerville:wght@700&family=Nunito:wght@700;900&family=Poppins:wght@400;500&display=swap');

body {
	font-family: 'Poppins', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	background-image: url(resources/home-bg-3.jpg);
	background-size: cover;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

#card-wrapper {
	background-color: #fff;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding: 20px;
	width: 400px;
}

h2 {
	color: black;
	text-align: center;
}

hr {
	border-top: 2px solid red;
	width: 100%;
	margin: 20px 0;
}

.table-responsive {
	margin-top: 20px;
}

table {
	width: 100%;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: black;
	color: #fff;
}

tr:hover {
	background-color: #f5f5f5;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	margin: 10px 0;
	font-weight: bold;
}

select, input, button {
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 100%;
}

button {
	background-color: red;
	color: #fff;
	cursor: pointer;
}

button:hover {
	transform: scale(1.1);
}
</style>
</head>
<body>
	<div id="card-wrapper">
		<h2>Book Plan!</h2>
		<hr>
		<div class="table-responsive">
			<!-- Your existing table code remains unchanged -->
		</div>

		<!-- Form for taking bookings -->
		<form action="processBuying" method="post">
			<label for="userName">User Name:</label> <input type="text"
				id="userName" name="userName" required> <label for="planId">Select
				a Plan:</label> <select id="planId" name="planId" required>
				<%-- Fetch plans from the database and populate the dropdown --%>
				<%
				Connection conn = null;
				PreparedStatement pstm = null;
				ResultSet rs = null;

				try {
					conn = ConnectionProvider.getConn();
					pstm = conn.prepareStatement("select * from plans");
					rs = pstm.executeQuery();

					while (rs.next()) {
						String planId = rs.getString("plan_id");
						String planName = rs.getString("plan_name");
				%>
				<option value="<%=planId%>"><%=planName%></option>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				// Close resources (Connection, PreparedStatement, ResultSet) here
				}
				%>
			</select> <label for="booking_date">Booking Date:</label> <input type="date"
				id="booking_date" name="booking_date" required>

			<button type="submit">Book Now</button>
		</form>
	</div>
</body>
</html>