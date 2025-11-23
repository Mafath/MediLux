package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.service.ProductService;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String img = request.getParameter("img");
		String category = request.getParameter("category");
		String quantity = request.getParameter("qty");

		boolean isTrue = ProductService.insertProduct(title, price, img, category, quantity);

		if (isTrue) {
			String alertMessage = "Product added Successfully";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href= 'AdminGetAllProductServlet'</script>"); //navigate to done.jsp if data got inserted successfully        
		} else {
		    RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
		    dis.forward(request, response);
		}

	}
}
