package com.medilux.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.service.FeedbackService;

@WebServlet("/AddFeedbackServlet")
public class AddFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String ageStr = request.getParameter("age");
        String message = request.getParameter("message");

        int age = 0;
        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid age format.");
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.getWriter().println("<script>alert('Please log in first!'); window.location.href='login.jsp';</script>");
            return;
        }

        int userId = ((com.medilux.model.UserModel) session.getAttribute("user")).getId();

        boolean isInserted = FeedbackService.insertFeedback(userId, name, email, city, age, message);

        if (isInserted) {
            response.getWriter().println("<script>alert('Feedback added successfully!'); window.location.href='UserShowAllFeedbackServlet';</script>");
        } else {
            request.setAttribute("errorMessage", "Failed to submit feedback.");
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
        }
    }
}
