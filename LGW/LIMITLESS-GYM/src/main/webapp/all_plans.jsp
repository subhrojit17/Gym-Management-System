<%@page import="com.entity.PlanDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page import="com.dao.PlandaoImp"%>
<%@page import="com.dao.PlanDao"%>
<%@page import="com.admin.PlansDeleteServlet"%>
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
* {
	justify-content: center;
	text-align: center;
}

h2 {
	color: black;
}

hr {
	border-top: 2px solid red;
}

.table-responsive {
	margin-top: 20px;
}

table {
	width: 100%;
	margin: 20px 0;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

td {
	text-decoration: none;
	color: red;
}

th {
	background-color: black;
	color: #fff;
}

tr:hover {
	background-color: #f5f5f5;
}

a {
	color: black;
	text-decoration: none;
	font-weight: bolder;
}
</style>
</head>
<body>

	<h2>
		<center>Plan List</center>
	</h2>
	<hr>
	<div class="table-responsive">
		<table
			class="table table-striped table-bordered table-hover table-condensed"
			width="80%" align="center">
			<tr>
				<th><center>Plan ID</center></th>
				<th><center>Plan Name</center></th>
				<th><center>Specification 1</center></th>
				<th><center>Specification 2</center></th>
				<th><center>Duration</center></th>
				<th><center>Price</center></th>
				<th colspan="2"><center>Action</center></th>
			</tr>

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
					String spec1 = rs.getString("specification1");
					String spec2 = rs.getString("specification2");
					String duration = rs.getString("duration");
					String price = rs.getString("price");

					out.println("<tr>");
					out.println("<td>" + planId + "</td>");
					out.println("<td>" + planName + "</td>");
					out.println("<td>" + spec1 + "</td>");
					out.println("<td>" + spec2 + "</td>");
					out.println("<td>" + duration + "</td>");
					out.println("<td>" + price + "</td>");
					out.println("<td><a href='delete_plans.jsp?planId=" + planId + "'>Delete</a></td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// Close resources (Connection, PreparedStatement, ResultSet) here
			}
			%>
		</table>
	</div>

</body>
</html>
