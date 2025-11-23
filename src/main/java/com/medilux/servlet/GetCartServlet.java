package com.medilux.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.CartModel;
import com.medilux.model.UserModel;
import com.medilux.service.CartService;

@WebServlet("/GetCartServlet")
public class GetCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) request.getSession().getAttribute("user");

        String userId = Integer.toString(user.getId());

        List<CartModel> cart = CartService.getCart(userId);
        request.setAttribute("Cart", cart);

        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}