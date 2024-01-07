package com.admin;
import com.dao.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PlandaoImp;
import com.DB.ConnectionProvider;
import com.entity.PlanDtls;

import java.io.PrintWriter;

@WebServlet("/EditPlansServlet")
public class EditPlansServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the parameters from the form
        int planId = Integer.parseInt(request.getParameter("planId"));
        String planName = request.getParameter("planName");
        String specification1 = request.getParameter("specification1");
        String specification2 = request.getParameter("specification2");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");
      

        // Create a PlanDtls object with the updated values
        PlanDtls updatedPlan = new PlanDtls();
        updatedPlan.setPlanId(planId);
        updatedPlan.setPlanName(planName);
        updatedPlan.setSpecification1(specification1);
        updatedPlan.setSpecification2(specification2);
        updatedPlan.setDuration(duration);
        updatedPlan.setPrice(price);
       
        // Assuming you have a PlanDao instance initialized and available
        PlanDao planDao = new PlandaoImp(ConnectionProvider.getConn());
        
        // Update the plan in the database
        planDao.updatePlan(updatedPlan);

        out.println("<html><head><title>Edit Plan</title></head><body>");
        out.println("<h2>Plan updated successfully!</h2>");
        out.println("<a href='admin-dashboard.html'>Go back to Admin Dashboard</a>");
        out.println("</body></html>");
    }
}
