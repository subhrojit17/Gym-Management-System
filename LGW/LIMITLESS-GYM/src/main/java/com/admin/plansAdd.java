package com.admin;
import java.io.File;
import com.DB.*;
import com.dao.*;
import com.entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPlanServlet")
public class plansAdd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String planName = request.getParameter("planName");
        String specification1 = request.getParameter("specification1");
        String specification2 = request.getParameter("specification2");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");
        
        PlanDtls newPlan = new PlanDtls();
        newPlan.setPlanName(planName);
        newPlan.setSpecification1(specification1);
        newPlan.setSpecification2(specification2);
        newPlan.setDuration(duration);
        newPlan.setPrice(price);
    

        // Assuming you have a PlanDao instance initialized and available
        PlanDao planDao = new PlandaoImp(ConnectionProvider.getConn());
        planDao.addPlan(newPlan);

        out.println("<html><head><title>Add Plan</title></head><body>");
        out.println("<h2>Plan added successfully!</h2>");
        out.println("<a href='admin_dashboard.jsp'>Go back to Admin Dashboard</a>");
        out.println("</body></html>");
    }
}
