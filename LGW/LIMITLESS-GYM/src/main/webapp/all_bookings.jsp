<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.BuyingDao"%>
<%@ page import="com.dao.BuyingdaoImp"%>
<%@ page import="com.DB.ConnectionProvider"%>
<%@ page import="com.entity.buying"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>

<%
    // Retrieve all bookings from the database
    try (Connection connection = ConnectionProvider.getConn()) {
        BuyingDao buyingDao = new BuyingdaoImp(connection);
        List<buying> bookings = buyingDao.getAllBookings();

        // Set bookings as a request attribute
        request.setAttribute("bookings", bookings);

    } catch (Exception e) {
        e.printStackTrace();
        // Handle the exception as needed
    }
%>

<html>
<head>
<title>All Bookings</title>
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
		<center>Booking List</center>
	</h2>
	<div class="table-responsive">
		<table
			class="table table-striped table-bordered table-hover table-condensed"
			width="80%" align="center">
			<tr>
				<th><center>Booking ID</center></th>
				<th><center>User Name</center></th>
				<th><center>Plan ID</center></th>
				<th><center>Booking Date</center></th>
			</tr>

			<%
                Connection conn = null;
                PreparedStatement pstm = null;
                ResultSet rs = null;

                try {
                    conn = ConnectionProvider.getConn();
                    pstm = conn.prepareStatement("SELECT * FROM bookings");
                    rs = pstm.executeQuery();

                    while (rs.next()) {
                        int bookingId = rs.getInt("booking_id");
                        String userName = rs.getString("user_name");
                        int planId = rs.getInt("plan_id");
                        Date bookingDate = rs.getDate("booking_date");

                        out.println("<tr>");
                        out.println("<td>" + bookingId + "</td>");
                        out.println("<td>" + userName + "</td>");
                        out.println("<td>" + planId + "</td>");
                        out.println("<td>" + bookingDate + "</td>");
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
