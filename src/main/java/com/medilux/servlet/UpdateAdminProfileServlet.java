package com.medilux.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medilux.model.UserModel;
import com.medilux.service.UserService;




@WebServlet("/UpdateAdminProfileServlet")
public class UpdateAdminProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Receives updated values from the form in update.jsp
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String phone = request.getParameter("phone");
		String add = request.getParameter("address");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		
		boolean isTrue;
		isTrue = UserService.updateprofile(id, name, gmail, phone, add, age, gender);
		
		if(isTrue == true) {

//			List<UserModel> userdetails = UserService.getById(id);
//			request.setAttribute("userdetails", userdetails);
			
			List<UserModel> userdetails = UserService.getById(id);
			if (!userdetails.isEmpty()) {
			    request.getSession().setAttribute("user", userdetails.get(0));
			}


			
			String alertMessage = "Profile Updated Successfully";        
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href= 'adminProfile.jsp'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
