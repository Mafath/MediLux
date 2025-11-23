package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.UserModel;

@WebServlet("/UserNavigateServlet")
public class UserNavigateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		processRequest(request, response);
//	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
		    UserModel user = (UserModel) session.getAttribute("user");
		    if (user != null) {
		        // Check user role
		        String role = user.getRole();
		        if ("admin".equalsIgnoreCase(role)) {
		            // Redirect to the admin dashboard
		            response.sendRedirect("adminDashboard.jsp");
		        } else {
		            // Redirect to the user profile page
		            response.sendRedirect("HomeProductServlet");
		        }
		    }
		} else {
		    // If no session, redirect to login page
		    response.sendRedirect("login.jsp");
		}

	}
}
