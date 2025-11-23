package com.medilux.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.service.CartService;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartIdStr = request.getParameter("cart_id");
        String quantityStr = request.getParameter("quantity");

        boolean isUpdated = false;

        try {
            int cartId = Integer.parseInt(cartIdStr);
            int quantity = Integer.parseInt(quantityStr);

            // Get current date and time
            LocalDateTime now = LocalDateTime.now();
            String currentDateTime = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

            // Update cart with new quantity and date
            isUpdated = CartService.updateCartItem(cartId, quantity, currentDateTime);

            String alertMessage = isUpdated ? "Cart item updated successfully." : "Failed to update cart item.";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetCartServlet';</script>");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Invalid input.'); window.location.href='GetCartServlet';</script>");
        }
    }
}