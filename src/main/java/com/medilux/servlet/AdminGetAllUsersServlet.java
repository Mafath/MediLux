package com.medilux.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.UserModel;
import com.medilux.service.UserService;

@WebServlet("/AdminGetAllUsersServlet")
public class AdminGetAllUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserModel> allUsers = UserService.getAllUsers();
		request.setAttribute("allUsers", allUsers);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("dashboardUsers.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
