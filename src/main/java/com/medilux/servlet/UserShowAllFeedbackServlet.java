package com.medilux.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medilux.model.FeedbackModel;
import com.medilux.service.FeedbackService;

@WebServlet("/UserShowAllFeedbackServlet")
public class UserShowAllFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<FeedbackModel> feedbackList = FeedbackService.getAllFeedbacks();
		request.setAttribute("feedbackList", feedbackList);
		RequestDispatcher rd = request.getRequestDispatcher("allfeedbacks.jsp");
		rd.forward(request, response);
	}
}
