package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.service.ProductService;
import com.medilux.model.ProductModel;

import java.util.List;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		boolean isTrue = ProductService.deleteProduct(id);

		if (isTrue) {
//			response.getWriter().println("<script>alert('Product deleted successfully'); window.location.href='AdminGetAllProductServlet';</script>");
			response.sendRedirect("AdminGetAllProductServlet");
		} else {
			List<ProductModel> productDetails = ProductService.getProductById(id);
			request.setAttribute("productDetails", productDetails);
			RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
			dis.forward(request, response);
		}
	}
}
