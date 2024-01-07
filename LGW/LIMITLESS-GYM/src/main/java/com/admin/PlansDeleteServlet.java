package com.admin;
import com.DB.*;
import com.dao.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class PlansDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the plan ID from the request
        int planId = Integer.parseInt(request.getParameter("planId"));

        // Initialize connection and prepared statement
        Connection connection = null;
        PreparedStatement pstmtDeletePlan = null;
        PreparedStatement pstmtUpdateBookings = null;

        try {
            // Get database connection
            connection = ConnectionProvider.getConn();

            // Begin transaction
            connection.setAutoCommit(false);

            // Prepare statement to delete the plan
            String sqlDeletePlan = "DELETE FROM plans WHERE plan_id=?";
            pstmtDeletePlan = connection.prepareStatement(sqlDeletePlan);
            pstmtDeletePlan.setInt(1, planId);
            pstmtDeletePlan.executeUpdate();

            // Prepare statement to update bookings
            String sqlUpdateBookings = "UPDATE bookings SET plan_id=NULL WHERE plan_id=?";
            pstmtUpdateBookings = connection.prepareStatement(sqlUpdateBookings);
            pstmtUpdateBookings.setInt(1, planId);
            pstmtUpdateBookings.executeUpdate();

            // Commit the transaction
            connection.commit();

            // Redirect to a confirmation page or back to the admin page
            response.sendRedirect("admin_dashboard.jsp");

        } catch (SQLException e) {
            // Handle exceptions appropriately
            try {
                // Rollback the transaction in case of an exception
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
            e.printStackTrace();

        } finally {
            // Close resources
            try {
                if (pstmtDeletePlan != null) {
                    pstmtDeletePlan.close();
                }
                if (pstmtUpdateBookings != null) {
                    pstmtUpdateBookings.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true); // Reset auto-commit to true
                    connection.close();
                }
            } catch (SQLException closeException) {
                closeException.printStackTrace();
            }
        }
    }
}
