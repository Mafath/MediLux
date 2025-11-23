<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.medilux.model.UserModel" %>

<%
    UserModel loggedUser = (UserModel) session.getAttribute("user");

	if (session.getAttribute("user") == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	
	// Restrict access only to the specific Gmail
    String email = loggedUser.getGmail();
    if (!"mafath@gmail.com".equals(email)) {
        out.println("<script>alert('Unauthorized access! Redirecting to dashboard...'); window.location.href='adminDashboard.jsp';</script>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Medilux Admin - Users</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="bg-gray-900 text-white min-h-screen flex">

  <!-- Sidebar Fixed to the left -->
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
    
    <!-- Header -->
    <div class="mb-8 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-teal-400">Users</h1>
      <button onclick="window.location.href='addNewAdmin.jsp';" class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded-lg shadow-lg flex items-center">
        <i class="fa fa-user-circle mr-2" aria-hidden="true"></i> Add Admin +
      </button>
    </div>


    <!-- Stats Cards -->
    <!--  
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
  <div class="bg-gray-800 p-6 rounded-2xl shadow-2xl flex items-center transform transition-transform duration-300 hover:-translate-y-1">
    <i class="fas fa-users text-2xl text-teal-400 mr-4"></i>
    <div>
      <p class="text-gray-400  text-sm">Total Users</p>
      <p class="text-base text-white">1,253</p>
    </div>
  </div>
  <div class="bg-gray-800 p-6 rounded-2xl shadow-2xl flex items-center transform transition-transform duration-300 hover:-translate-y-1">
    <i class="fas fa-user-check text-2xl text-green-400 mr-4"></i>
    <div>
      <p class="text-gray-400  text-sm">Active Users</p>
      <p class="text-base text-white">1,142</p>
    </div>
  </div>
  <div class="bg-gray-800 p-6 rounded-2xl shadow-2xl flex items-center transform transition-transform duration-300 hover:-translate-y-1">
    <i class="fas fa-user-clock text-2xl text-yellow-400 mr-4"></i>
    <div>
      <p class="text-gray-400  text-sm">Pending Approvals</p>
      <p class="text-base text-white">19</p>
    </div>
  </div>
</div>
-->

    <!-- Search & Filter -->
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
      <input type="text" id="searchInput" placeholder="Search users..." class="w-full md:w-1/3 px-4 py-2 rounded-lg bg-gray-800 text-white text-sm border border-gray-700 focus:ring-2 focus:ring-teal-500 focus:outline-none">
      <div class="flex space-x-4">
        <select id="roleFilter" class="bg-gray-800 text-white text-sm px-4 py-2 border border-gray-700 rounded-lg">
        <option value="all">All Users</option>
        <option value="admin">Admins</option>
        <option value="user">Customers</option>
      </select>
      </div>
    </div>
    
    
    <!-- Users Table -->
    <div class="overflow-auto rounded-2xl shadow-lg bg-gray-900">
      <table class="w-full table-auto text-left border border-gray-700 border-collapse">
        <thead class="bg-gray-800 text-teal-400 text-xs uppercase">
          <tr class=" bg-gray-700">
            <th class="px-4 py-3">ID</th>
            <th class="px-4 py-3">Name</th>
            <th class="px-4 py-3">Gmail</th>
            <th class="px-4 py-3">Phone</th>
            <th class="px-4 py-3">Address</th>
            <th class="px-4 py-3">Age</th>
            <th class="px-4 py-3">Gender</th>
            <th class="px-4 py-3">Role</th>
            <th class="px-4 py-3">Actions</th>
          </tr>
        </thead>
        <tbody class="text-gray-300 divide-y divide-gray-800">
          <c:forEach var="user" items="${allUsers}">
            <tr class="userRow" data-role="${user.getRole()}">
              <td class="px-4 py-4 text-sm">${user.getId()}</td>
              <td class="px-4 py-4 flex items-center space-x-3 text-sm">
				<img src="${not empty user.getProfile_picture_url() ? user.getProfile_picture_url() : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUW0u5Eiiy3oM6wcpeEE6sXCzlh8G-tX1_Iw&s'}" class="w-8 h-8 rounded-full object-cover border border-black">
                <span>${user.getName()}</span>
              </td>
              <td class="px-4 py-4 text-sm">${user.getGmail()}</td>
              <td class="px-4 py-4 text-sm">${user.getPhone()}</td>
              <td class="px-4 py-4 text-sm">${user.getAddress()}</td>
              <td class="px-4 py-4 text-sm">${user.getAge()}</td>
              <td class="px-4 py-4 text-sm">${user.getGender()}</td>
              <td class="px-4 py-4 text-sm">
                <span class="bg-teal-400 text-black text-xs px-3 py-1 rounded-full">${user.getRole()}</span>
              </td>
              <td class="px-4 py-4 flex space-x-6">


	        <form action="DeleteAdminServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
			  <input type="hidden" name="id" value="${user.getId()}" />
			  <button class="text-red-400 hover:text-red-600 text-sm"><i class="fas fa-trash"></i> Remove</button>		
			</form>

       		 </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

  </div>
  
  <!-- JavaScript for search Users -->
	<script>
	    function filterTable() {
	        var input, filter, table, tr, td, i, j, txtValue;
	        input = document.getElementById("searchInput");
	        filter = input.value.toUpperCase();
	        table = document.querySelector("table");
	        tr = table.getElementsByTagName("tr");
	
	        for (i = 1; i < tr.length; i++) { // Start from 1 to skip the table header row. looping throught each rows
	            td = tr[i].getElementsByTagName("td"); //gets all the td cells in the current row
	            tr[i].style.display = "none"; // Default to hide
	            for (j = 0; j < td.length; j++) {//looping throught each cell in the row
	                if (td[j]) {
	                    txtValue = td[j].textContent || td[j].innerText;//getting the text content of the cell
	                    if (txtValue.toUpperCase().indexOf(filter) > -1) {//checks if the searched strung is exists in the txtValue
	                        tr[i].style.display = ""; //if a match is found, show the row by resetting display to default
	                        break;
	                    }
	                }
	            }
	        }
	    }
	
	    document.getElementById("searchInput").addEventListener("input", filterTable);
	    //calls the function
	</script>
	
	<!-- filtering by user role -->
	<script>
		const roleFilter = document.getElementById('roleFilter');
		const userRows = document.querySelectorAll('.userRow');

		roleFilter.addEventListener('change', function() {
			  const selectedRole = this.value;
			  userRows.forEach(row => {
				    const rowRole = row.getAttribute('data-role');
				    if (selectedRole === 'all' || rowRole.toLowerCase() === selectedRole) {
				      row.style.display = '';
				    } else {
				      row.style.display = 'none';
				    }
			  });
		});
	</script>
  
</body>
</html>
