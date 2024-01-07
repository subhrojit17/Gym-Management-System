package com.org.controller.login;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signin
 */
@WebServlet("/signin")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("uemail");
		String upwd = request.getParameter("upwd");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","quasar");
	    	PreparedStatement pst = con.prepareStatement("select * from user where uemail = ? and upwd = ? ");
	    	PreparedStatement ps = con.prepareStatement("select * from adminlogin where uemail = ? and upwd = ? ");
	    	pst.setString(1,uemail);
	    	pst.setString(2,upwd);
	    	ps.setString(1,uemail);
	    	ps.setString(2,upwd);
	    	ResultSet r = ps.executeQuery();
	    	ResultSet rs = pst.executeQuery();
	    	
	    	if(rs.next()) {
	    		session.setAttribute("name",rs.getString("uname"));
	    		dispatcher = request.getRequestDispatcher("index.jsp");
	    	} 
	    	else if(r.next()) {
	    		session.setAttribute("name",r.getString("uname"));
	    		dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
	    	} 
	    	
	    	
	    	else {
	    		request.setAttribute("status","failed");
	    		dispatcher = request.getRequestDispatcher("login.jsp");
	    	}
	    	dispatcher.forward(request, response);
		}
		catch(SQLException | ClassNotFoundException e){
    		e.printStackTrace();
    	} 
	}
}



