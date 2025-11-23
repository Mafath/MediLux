package com.medilux.servlet;

import com.medilux.model.FeedbackModel;
import com.medilux.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/GetFeedbackByIdServlet")
public class GetFeedbackByIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeedbackService feedbackService;

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int feedbackId = Integer.parseInt(request.getParameter("id"));
            FeedbackModel feedback = feedbackService.getFeedbackById(feedbackId);

            if (feedback != null) {
                request.setAttribute("feedback", feedback);
                request.getRequestDispatcher("editFeedback.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("message", "Feedback not found.");
                response.sendRedirect("showFeedback.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Invalid feedback ID.");
            response.sendRedirect("showFeedback.jsp");
        }
    }
}
