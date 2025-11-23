package com.medilux.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.ProductModel;
import com.medilux.service.ProductService;

@WebServlet("/AdminUpdateProductServlet")
public class AdminUpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String category = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String image = request.getParameter("image");

		boolean isTrue = ProductService.updateProduct(id, name, price, category, quantity, image);

		if (isTrue) {
			List<ProductModel> productDetails = ProductService.getProductById(id);
			request.setAttribute("productDetails", productDetails);
			response.getWriter().println("<script>alert('Product updated successfully'); window.location.href='AdminGetAllProductServlet';</script>");
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
			dis.forward(request, response);
		}
	}
}
