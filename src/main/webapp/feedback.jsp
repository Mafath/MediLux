<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }


%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
      <title>MediLux - Add Feedback</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>
<body class="bg-gray-100 text-sm">

  <%@ include file="header.jsp" %>


<div class="max-w-4xl mx-auto bg-white rounded-2xl shadow-xl overflow-hidden px-6 py-8 space-y-10 mt-12 mb-12">
    <div class="text-center">
        <h2 class="text-2xl font-bold text-teal-600 mb-1">
            <i class="fas fa-notes-medical mr-1"></i>Patient Feedback
        </h2>
        <p class="text-gray-600">We value your feedback. Please share your experience with us.</p>
    </div>

    <form action="AddFeedbackServlet" method="post" class="space-y-6">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block mb-1 font-medium text-gray-700">Name</label>
                <input type="text" name="name" required placeholder="Enter your name"
                       class="w-full border px-3 py-2 rounded-md focus:ring-1 focus:ring-teal-400 text-sm" />
            </div>
            <div>
                <label class="block mb-1 font-medium text-gray-700">City</label>
                <input type="text" name="city" required placeholder="Enter your city"
                       class="w-full border px-3 py-2 rounded-md focus:ring-1 focus:ring-teal-400 text-sm" />
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block mb-1 font-medium text-gray-700">Email</label>
                <input type="email" name="email" readonly required value=<%= loggedUser.getGmail() %> placeholder="Enter your email"
                       class="w-full border px-3 py-2 rounded-md text-sm" />
            </div>
            <div>
                <label class="block mb-1 font-medium text-gray-700">Age</label>
                <input type="number" name="age" required placeholder="Enter your age" min="1"
                       class="w-full border px-3 py-2 rounded-md focus:ring-1 focus:ring-teal-400 text-sm" />
            </div>
        </div>

        <div>
            <label class="block mb-1 font-medium text-gray-700">Message</label>
            <textarea name="message" rows="3" required placeholder="Share your thoughts..."
                      class="w-full border px-3 py-2 rounded-md focus:ring-1 focus:ring-teal-400 text-sm resize-none"></textarea>
        </div>

        <button type="submit"
                class="w-full py-2.5 text-sm bg-gradient-to-r from-teal-500 to-teal-600 text-white rounded-md hover:from-teal-600 hover:to-teal-700 transition duration-300">
            Submit Feedback
        </button>
    </form>
</div>



   <%@ include file="footer.jsp" %>

</body>
</html>
