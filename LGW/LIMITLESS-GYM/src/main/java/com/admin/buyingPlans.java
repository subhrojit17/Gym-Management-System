package com.admin;

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

@WebServlet("/buyingPlans")
public class buyingPlans extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String userName = request.getParameter("userName");
        int planId = Integer.parseInt(request.getParameter("planId"));

        try (Connection connection = ConnectionProvider.getConn()) {
            BuyingDao buyingDao = new BuyingdaoImp(connection);

            // Create a Buying object
            buying buying = new buying();
            buying.setUserName(userName);
            buying.setPlanId(planId);

            // Save the buying information to the database
            boolean buyingSuccessful = buyingDao.processBuying(buying);

            if (buyingSuccessful) {
                // Redirect to a success page or display a success message
                response.sendRedirect("success.jsp");
            } else {
                // Handle the case where buying failed, e.g., redirect to an error page
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed, e.g., redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
