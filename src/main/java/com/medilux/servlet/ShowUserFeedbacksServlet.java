package com.medilux.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.medilux.model.FeedbackModel;
import com.medilux.service.FeedbackService;

@WebServlet("/ShowUserFeedbacksServlet")
public class ShowUserFeedbacksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = ((com.medilux.model.UserModel) session.getAttribute("user")).getId();

        List<FeedbackModel> feedbackList = FeedbackService.getUserFeedbacks(userId);
        request.setAttribute("feedbackList", feedbackList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("showFeedback.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
