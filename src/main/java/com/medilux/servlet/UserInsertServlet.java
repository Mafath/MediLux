package com.medilux.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medilux.service.UserService;

@WebServlet("/UserInsertServlet")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String password = request.getParameter("password");
//		String phone = request.getParameter("phone");
//		Dont use the id here. because id is not inserted by user. Its an auto incremented one
		
		
		
		boolean isTrue;
		
		// Check if email is already taken
        if (UserService.isEmailTaken(gmail)) {
        	
        	
        	// Invalid credentials
            request.setAttribute("error", "Email is already registered. Please use a different email.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        	
        	
//            String alertMessage = "Email is already registered. Please use a different email.";
//            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href= 'Register.jsp'</script>");
        } else {
		
			isTrue = UserService.insertdata(name, gmail, password);
			
			if(isTrue == true) {
				String alertMessage = "Register Successful";         
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href= 'login.jsp'</script>");
				
			}
			else {
				RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
				dis2.forward(request, response);
			}
        }
	}

}
