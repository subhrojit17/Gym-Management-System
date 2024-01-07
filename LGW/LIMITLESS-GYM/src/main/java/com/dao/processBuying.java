package com.dao;

import com.DB.ConnectionProvider;
import com.dao.BuyingDao;
import com.dao.BuyingdaoImp;
import com.entity.buying;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/processBuying")
public class processBuying extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String userName = request.getParameter("userName");
        int planId = Integer.parseInt(request.getParameter("planId"));
        String bookingDate = request.getParameter("booking_date");

        // Assuming you have a DatabaseConnectionManager class that provides the connection
        try (Connection connection = ConnectionProvider.getConn()) {
            BuyingDao buyingDao = new BuyingdaoImp(connection);

            // Create a Buying object
            buying buying = new buying();
            buying.setUserName(userName);
            buying.setPlanId(planId);
            buying.setBookingDate(bookingDate);

            // Process the booking
            buyingDao.processBuying(buying);

            // Redirect to a success page or display a success message
            response.sendRedirect("success.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed, e.g., redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
