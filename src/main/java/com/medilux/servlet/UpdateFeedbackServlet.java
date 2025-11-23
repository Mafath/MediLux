package com.medilux.servlet;

import com.medilux.model.FeedbackModel;
import com.medilux.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateFeedbackServlet")
public class UpdateFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeedbackService feedbackService;

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("feedback_id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        int age = Integer.parseInt(request.getParameter("age"));
        String message = request.getParameter("message");

        FeedbackModel feedback = new FeedbackModel();
        feedback.setId(id);
        feedback.setName(name);
        feedback.setEmail(email);
        feedback.setCity(city);
        feedback.setAge(age);
        feedback.setMessage(message);

        boolean updated = feedbackService.updateFeedback(feedback);

        if (updated) {
            response.sendRedirect("ShowUserFeedbacksServlet");
        } else {
            response.sendRedirect("editFeedback.jsp?error=true");
        }
    }
}
