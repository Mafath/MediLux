package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.service.ProductService;
import com.medilux.service.UserService;
import com.medilux.model.ProductModel;
import com.medilux.model.UserModel;

import java.util.List;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		boolean isTrue = UserService.deleteUser(id);

		if (isTrue) {
//			response.getWriter().println("<script>alert('User deleted successfully'); window.location.href='AdminGetAllUsersServlet';</script>");
			response.sendRedirect("AdminGetAllUsersServlet");
		} else {
			List<UserModel> UserDetails = UserService.getById(id);
			request.setAttribute("UserDetails", UserDetails);
			RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
			dis.forward(request, response);
		}
	}
}
