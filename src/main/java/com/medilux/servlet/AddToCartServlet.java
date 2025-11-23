package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medilux.model.UserModel;
import com.medilux.service.CartService;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productid = request.getParameter("id");
        String itemquantity = request.getParameter("quantity");

        int product_id = Integer.parseInt(productid);
        int quantity = Integer.parseInt(itemquantity);

        // Get logged-in user
        UserModel user = (UserModel) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        boolean isTrue;
        isTrue = CartService.insertdata(user.getId(), product_id, quantity);

        if (isTrue == true) {
            String alertMessage = "Item added to cart Successfully";
            response.getWriter().println(
                "<script> alert('" + alertMessage + "'); window.location.href= 'GetAllProductServlet'</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}