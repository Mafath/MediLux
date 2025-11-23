<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.medilux.model.FeedbackModel" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    FeedbackModel feedback = (FeedbackModel) request.getAttribute("feedback");
    if (feedback == null) {
        response.sendRedirect("showFeedback.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Feedback</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-gray-100 to-teal-100 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-lg rounded-xl p-8 w-full max-w-xl">
        <h2 class="text-2xl font-bold text-teal-700 mb-6 text-center">Edit Your Feedback</h2>

        <form action="UpdateFeedbackServlet" method="post" class="space-y-4">
            <input type="hidden" name="feedback_id" value="<%= feedback.getId() %>"/>

            <div>
                <label class="block text-gray-700 mb-1">Name</label>
                <input type="text" name="name" value="<%= feedback.getName() %>"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400" required>
            </div>

            <div>
                <label class="block text-gray-700 mb-1">Email</label>
                <input type="email" name="email" value="<%= feedback.getEmail() %>"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400" required readonly>
            </div>

            <div>
                <label class="block text-gray-700 mb-1">City</label>
                <input type="text" name="city" value="<%= feedback.getCity() %>"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400">
            </div>

            <div>
                <label class="block text-gray-700 mb-1">Age</label>
                <input type="number" min="1" name="age" value="<%= feedback.getAge() %>"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400">
            </div>

            <div>
                <label class="block text-gray-700 mb-1">Message</label>
                <textarea name="message" rows="4"
                          class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400"
                          required><%= feedback.getMessage() %></textarea>
            </div>

            <div class="flex justify-between items-center pt-4">
                <a href="ShowUserFeedbacksServlet" class="text-teal-600 underline">Cancel</a>
                <button type="submit"
                        class="bg-teal-600 text-white px-6 py-2 rounded-lg hover:bg-teal-700 transition duration-200">
                    Update Feedback
                </button>
            </div>
        </form>
    </div>
</body>
</html>
