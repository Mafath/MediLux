<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.medilux.model.UserModel" %>
    
<%
    UserModel loggedUser = (UserModel) session.getAttribute("user");

	if (session.getAttribute("user") == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medilux - Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/lucide@latest/dist/umd/lucide.min.js" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen text-white">

<!-- Header -->
<div class="relative z-20">
  <!-- Navigation Bar -->
  <header class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center py-4">
        <a href="#" class="flex items-center space-x-2">
          <i class="fa-solid fa-stethoscope text-teal-600 text-2xl"></i>
          <span class="text-xl font-bold text-teal-700">MediLux</span>
        </a>

        <div class="hidden md:flex space-x-4">	
       		<button onclick="location.href='GetAdminProfileServlet'" class="flex items-center space-x-2 bg-gray-100 px-3 py-2 rounded-full hover:bg-gray-400 hover:text-white">
     				<i class="fas fa-user text-teal-600"></i>
     				<span class="text-sm font-medium text-gray-700"><%= loggedUser.getName() %></span>
   			</button>
  			<div class="flex items-center space-x-4">
			      <button type="submit" onclick="confirmLogout(event)" class="flex items-center px-3 py-2 text-white rounded-full bg-black hover:text-white transition-colors duration-300 ease-in-out text-sm">
					  <i class="fas fa-sign-out-alt mr-2"></i>Logout
				  </button>
  			</div>


        </div>
      </div>
    </div>
  </header>
</div>


  <div class="flex">
    <!-- Sidebar -->
    <aside class="w-52 bg-gray-950 p-6 min-h-screen shadow-xl">
      <h1 class="text-xl font-bold text-teal-400 mb-10">Medilux Admin</h1>
      <nav class="space-y-6">
        <a href="adminDashboard.jsp" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-tachometer-alt mr-3"></i>Dashboard</a>
        <a href="AdminGetAllUsersServlet" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-users mr-3"></i>Users</a>
        <a href="AdminGetAllProductServlet" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-cogs mr-3"></i>Inventory</a>
        <a href="#" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-box mr-3"></i>Orders</a>
        <a href="#" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-question-circle mr-3"></i>Inquiries</a>
        <a href="showAllFeedbacks" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-comments mr-3"></i>Feedbacks</a>
        <a href="#" class="flex items-center gap-3 text-gray-300 hover:text-teal-400"><i class="fas fa-cogs mr-3"></i>Settings</a>
      </nav>
    </aside>


    <!-- Main Content -->
    <main class="flex-1 p-10">
	<div class="flex justify-between items-center mb-8">
        <h2 class="text-3xl font-semibold">Dashboard Overview</h2>

      </div>

      <!-- Stats Cards -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-gray-900 rounded-2xl p-6 shadow-lg">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-base font-medium">Total Sales</h3>
              <p class="text-base mt-2">Rs. 24,200</p>
            </div>
            <i data-lucide="dollar-sign" class="text-teal-400"></i>
          </div>
        </div>
        <div class="bg-gray-900 rounded-2xl p-6 shadow-lg">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-base font-medium">New Users</h3>
              <p class="text-base mt-2">1,452</p>
            </div>
            <i data-lucide="user-plus" class="text-teal-400"></i>
          </div>
        </div>
        <div class="bg-gray-900 rounded-2xl p-6 shadow-lg">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-base font-medium">Orders</h3>
              <p class="text-base mt-2">785</p>
            </div>
            <i data-lucide="package" class="text-teal-400"></i>
          </div>
        </div>
        <div class="bg-gray-900 rounded-2xl p-6 shadow-lg">
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-base font-medium">Revenue</h3>
              <p class="text-base mt-2">Rs. 8,900</p>
            </div>
            <i data-lucide="bar-chart-2" class="text-teal-400"></i>
          </div>
        </div>
      </div>

      <!-- Recent Orders Table -->
      <div class="mt-12 bg-gray-900 rounded-2xl p-6 shadow-lg">
        <h3 class="text-xl font-semibold mb-4">Recent Orders</h3>
        <table class="w-full text-left">
          <thead>
            <tr class="text-teal-400 border-b border-gray-700 text-sm">
              <th class="pb-3">Order ID</th>
              <th class="pb-3">Customer</th>
              <th class="pb-3">Amount</th>
              <th class="pb-3">Status</th>
            </tr>
          </thead>
          <tbody class="text-gray-300">
            <tr class="border-b border-gray-800 text-sm">
              <td class="py-3">#00124</td>
              <td class="py-3">Alice Martin</td>
              <td class="py-3">Rs. 120.00</td>
              <td class="py-3 text-green-400">Completed</td>
            </tr>
            <tr class="border-b border-gray-800 text-sm">
              <td class="py-3">#00125</td>
              <td class="py-3">John Doe</td>
              <td class="py-3">Rs. 85.50</td>
              <td class="py-3 text-yellow-400">Pending</td>
            </tr>
            <tr class="text-sm">
              <td class="py-3">#00126</td>
              <td class="py-3">Emma Watson</td>
              <td class="py-3">Rs. 45.00</td>
              <td class="py-3 text-red-400">Cancelled</td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <script>
    lucide.createIcons();
  </script>
  
  <script>
    function confirmLogout(event) {
      event.preventDefault();
      const confirmed = confirm("Are you sure you want to logout?");
      if (confirmed) {
        window.location.href = "UserLogoutServlet";
      }
    }
</script>
</body>
</html>
