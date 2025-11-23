<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Medilux Admin - Feedbacks</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="bg-gray-900 text-white min-h-screen flex">

  <!-- Sidebar -->
  <div class="w-52 bg-gray-800 h-screen fixed top-0 left-0 p-6 text-md">
    <h2 class="text-xl font-bold text-teal-400 mb-8">Medilux Admin</h2>
    <ul>
      <li><a href="adminDashboard.jsp" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-tachometer-alt mr-3"></i> Dashboard</a></li>
      <li><a href="AdminGetAllUsersServlet" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-users mr-3"></i> Users</a></li>
      <li><a href="AdminGetAllProductServlet" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-cogs mr-3"></i> Inventory</a></li>
      <li><a href="#" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-box mr-3"></i> Orders</a></li>
      <li><a href="#" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-question-circle mr-3"></i> Inquiries</a></li>
      <li><a href="showAllFeedbacks" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-comments mr-3"></i> Feedbacks</a></li>
      <li><a href="#" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-cogs mr-3"></i> Settings</a></li>
    </ul>
  </div>

  <!-- Content Area -->
  <div class="flex-1 p-6 ml-64 overflow-y-auto h-screen">
    <div class="mb-8 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-teal-400">User Feedback Records</h1>
    </div>

    <!-- Feedback Table -->
    <div class="bg-gray-800 rounded-lg shadow-lg p-6">
      <h2 class="text-xl font-semibold text-teal-300 mb-4">All Feedback Submissions</h2>

      <table class="w-full text-left text-sm rounded overflow-hidden">
        <thead>
          <tr class="bg-gray-700 text-teal-400">
            <th class="py-3 px-4">ID</th>
            <th class="py-3 px-4">User ID</th>
            <th class="py-3 px-4">Name</th>
            <th class="py-3 px-4">Email</th>
            <th class="py-3 px-4">City</th>
            <th class="py-3 px-4">Age</th>
            <th class="py-3 px-4">Message</th>
            <th class="py-3 px-4">Submitted At</th>
            <th class="py-3 px-4">Actions</th>
          </tr>
        </thead>
        <tbody class="text-gray-300">
          <c:forEach var="fb" items="${feedbackList}">
            <tr class="border-b border-gray-600 hover:bg-gray-700">
              <td class="py-6 px-4">${fb.getId()}</td>
              <td class="py-6 px-4">${fb.getUserId()}</td>
              <td class="py-6 px-4">${fb.getName()}</td>
              <td class="py-6 px-4">${fb.getEmail()}</td>
              <td class="py-6 px-4">${fb.getCity()}</td>
              <td class="py-6 px-4">${fb.getAge()}</td>
              <td class="py-6 px-4">${fb.getMessage()}</td>
              <td class="py-6 px-4">${fb.getSubmitDate()}</td>
              <td class="py-6 px-4">
                <a href="DeleteAdminFeedbackServlet?id=${fb.getId()}" 
                   class="text-red-400 hover:text-red-600"
                   onclick="return confirm('Are you sure you want to delete this feedback?');"
                   title="Delete">
                  <i class="fas fa-trash"></i>
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
