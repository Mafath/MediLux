//package com.medilux.servlet;
//
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//
//import com.medilux.model.ProductModel;
//import com.medilux.service.ProductService;
//
//@WebServlet("/UpdateProductServlet")
//public class UpdateProductServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("id");
//		String title = request.getParameter("title");
//		String price = request.getParameter("price");
//		String img = request.getParameter("img");
//
//		boolean isTrue = ProductService.updateProduct(id, title, price, img);
//
//		if (isTrue) {
//			List<ProductModel> productDetails = ProductService.getProductById(id);
//			request.setAttribute("productDetails", productDetails);
//			response.getWriter().println("<script>alert('Product updated successfully'); window.location.href='GetAllProductServlet';</script>");
//		} else {
//			RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
//			dis.forward(request, response);
//		}
//	}
//}
