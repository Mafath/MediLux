package com.medilux.servlet;

import com.medilux.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
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
            boolean deleted = feedbackService.deleteFeedbackById(feedbackId);

            if (deleted) {
                request.getSession().setAttribute("message", "Feedback deleted successfully.");
            } else {
                request.getSession().setAttribute("message", "Failed to delete feedback.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Invalid feedback ID.");
        }

        // Redirect back to the page that lists feedback
        response.sendRedirect("ShowUserFeedbacksServlet");
    }
}
