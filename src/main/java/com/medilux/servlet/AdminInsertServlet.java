package com.medilux.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medilux.service.UserService;

@WebServlet("/AdminInsertServlet")
public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String password = request.getParameter("password");
//		String phone = request.getParameter("phone");
		
		
		boolean isTrue;
		
		// Check if email is already taken
        if (UserService.isEmailTaken(gmail)) {
            String alertMessage = "Email is already registered. Please use a different email.";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href= 'addNewAdmin.jsp'</script>");
        } else {
		
			isTrue = UserService.insertAdmin(name, gmail, password);
			
			if(isTrue == true) {
				String alertMessage = "Admin added Successfully";  
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href= 'AdminGetAllUsersServlet'</script>");
				
			}
			else {
				RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
				dis2.forward(request, response);
			}
        }
	}

}
