<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.medilux.model.FeedbackModel" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<FeedbackModel> feedbacks = (List<FeedbackModel>) request.getAttribute("feedbackList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MediLux - My Feedbacks</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

  <%@ include file="header.jsp" %>
  
	 <div class="fixed top-[100px] right-0 flex flex-col space-y-3 z-50">
	   <a href="feedback.jsp" class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded-l-2xl shadow-md transition-all duration-300">
	       Add Feedback
	   </a>
	</div>

    <div class="max-w-4xl mx-auto bg-white p-6 rounded-xl shadow-lg mt-12">
        <h2 class="text-2xl font-bold text-teal-600 mb-4">Your Feedbacks</h2>

        <% if (feedbacks == null || feedbacks.isEmpty()) { %>
            <p class="text-gray-600">You have not submitted any feedback yet.</p>
        <% } else { %>
            <div class="space-y-4">
                <% for (FeedbackModel fb : feedbacks) { %>
                    <div class="p-4 border rounded-md bg-gray-50 shadow-md">
                        <div class="flex justify-between items-start mb-2">
                            <div>
                                <p><strong>Name:</strong> <%= fb.getName() %></p>
                                <p><strong>Email:</strong> <%= fb.getEmail() %></p>
                                <p><strong>City:</strong> <%= fb.getCity() %></p>
                                <p><strong>Age:</strong> <%= fb.getAge() %></p>
                                <p><strong>Message:</strong> <%= fb.getMessage() %></p>
                                <p class="text-sm text-gray-500 mt-1">Submitted on: <%= fb.getSubmitDate() %></p>
                            </div>
                            <div class="flex flex-col space-y-2 ml-4">
                                <a href="GetFeedbackByIdServlet?id=<%= fb.getId() %>" class="px-4 py-1 bg-blue-500 text-white rounded-md hover:bg-blue-600 text-sm text-center">Edit</a>
                                <a href="DeleteFeedbackServlet?id=<%= fb.getId() %>" onclick="return confirm('Are you sure you want to delete this feedback?');" class="px-4 py-1 bg-red-500 text-white rounded-md hover:bg-red-600 text-sm text-center">Delete</a>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>
