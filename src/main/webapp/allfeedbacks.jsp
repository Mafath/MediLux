<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.medilux.model.FeedbackModel" %>

<%

	List<FeedbackModel> feedbackList = (List<FeedbackModel>) request.getAttribute("feedbackList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
      <title>MediLux - Feedbacks</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-white via-teal-50 to-white min-h-screen">
    
    <%@ include file="header.jsp" %>

    <!-- Fixed top-right buttons -->
    <div class="fixed top-[100px] right-0 flex flex-col space-y-3 z-50">
        <a href="ShowUserFeedbacksServlet" class="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2 rounded-l-2xl shadow-md transition-all duration-300">
            My Feedbacks
        </a>
        <a href="feedback.jsp" class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded-l-2xl shadow-md transition-all duration-300">
            Add Feedback
        </a>
    </div>

    <!-- Main Content -->
    <div class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8 mb-12">
        <h1 class="text-4xl font-bold text-black mb-10 text-center">Testimonials</h1>

        <% if (feedbackList != null && !feedbackList.isEmpty()) { %>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <% for (FeedbackModel fb : feedbackList) { %>
                    <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition duration-300">
                        <h2 class="text-lg font-semibold text-gray-800 mb-2">
                            <i class="fas fa-user text-teal-600 mr-2"></i><%= fb.getName() %>
                        </h2>
                        <p class="text-sm text-gray-600 mb-1">
                            <i class="fas fa-envelope mr-2 text-teal-500"></i><%= fb.getEmail() %>
                        </p>
                        <p class="text-sm text-gray-600 mb-1">
                            <i class="fas fa-map-marker-alt mr-2 text-teal-500"></i><%= fb.getCity() %>
                        </p>
                        <div class="bg-gray-50 border border-gray-200 rounded-md p-4 text-sm text-gray-700">
                            "<%= fb.getMessage() %>"
                        </div>
                    </div>
                <% } %>
            </div>
        <% } else { %>
            <div class="text-center text-gray-600 text-lg">No feedbacks found.</div>
        <% } %>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
