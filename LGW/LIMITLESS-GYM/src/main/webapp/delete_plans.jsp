<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DB.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Plan</title>
</head>
<body>
<%
String planId = request.getParameter("planId"); // Corrected variable name
Connection con;
PreparedStatement pstm;
try {
    con = ConnectionProvider.getConn();
    pstm = con.prepareStatement("delete from plans where plan_id=?");
    pstm.setString(1, planId);
    pstm.executeUpdate();
    con.close();
    response.sendRedirect("all_plans.jsp");
} catch (Exception e) {
    e.printStackTrace(); // Handle exceptions appropriately in a production environment
}
%>
</body>
</html>
