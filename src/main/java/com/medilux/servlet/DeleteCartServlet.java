package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.service.CartService;

@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the cart item ID from the request
        String cartIdStr = request.getParameter("id");

        try {
            int cartId = Integer.parseInt(cartIdStr);

            // Call the delete method from CartService
            boolean isDeleted = CartService.deleteCartItem(cartId);

            if (isDeleted) {
                // Optionally, set a success message in session or request
                request.getSession().setAttribute("message", "Item deleted successfully.");
            } else {
                request.getSession().setAttribute("error", "Failed to delete item.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Invalid item ID.");
        }

        // Redirect back to the cart view
        response.sendRedirect("GetCartServlet");
    }
}