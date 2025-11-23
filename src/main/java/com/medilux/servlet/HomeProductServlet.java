package com.medilux.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.ProductModel;
import com.medilux.service.ProductService;

@WebServlet("/HomeProductServlet")
public class HomeProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductModel> featuredProducts = ProductService.getLimitedProducts(7); // Get latest 4 products
        request.setAttribute("featuredProducts", featuredProducts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}