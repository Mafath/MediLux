package com.medilux.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.UserModel;
import com.medilux.service.UserService;

@WebServlet("/GetUserProfileServlet")
public class GetUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Check if session exists without creating a new one
		HttpSession session = request.getSession(false);

		// If session is null or user is not logged in, redirect to login
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp?sessionExpired=true");
			return;
		}
		
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        String userId = Integer.toString(user.getId());
		
		List<UserModel> User = UserService.getById(userId);
		request.setAttribute("User", User);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
