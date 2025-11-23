package com.medilux.servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medilux.model.UserModel;
import com.medilux.service.UserService;


@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gmail = request.getParameter("gmail");
		String password = request.getParameter("password");
		
		try {
			List<UserModel> userlogin = UserService.loginValidate(gmail, password);
			
			if(userlogin !=null && !userlogin.isEmpty()) {
//				String alertMessage = "Login Successful";
				
				UserModel loggedInUser = userlogin.get(0);
				request.getSession().setAttribute("user", loggedInUser);

				response.sendRedirect("UserNavigateServlet"); // Everyone goes to UserNavigateServlet
				
//				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='profile.jsp'</script>");
			}else {
				
				
				// Invalid credentials
	            request.setAttribute("error", "Invalid username or password.");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
				
//				String alertMessage = "Invalid Credentials. Please try again!!";
//				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='login.jsp'</script>");
			}
			
//			request.setAttribute("userlogin", userlogin);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
