<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.medilux.model.UserModel" %>
<%

    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Medilux - Admin Profile</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="bg-gradient-to-tr from-white via-gray-100 to-gray-200 min-h-screen">




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
       		<button onclick="location.href='adminDashboard.jsp'" class="flex items-center space-x-2 bg-gray-100 px-3 py-2 rounded-full hover:bg-gray-400 hover:text-white">
     				<i class="fas fa-user text-teal-600"></i>
     				<span class="text-sm font-medium text-gray-700">Admin Dashboard</span>
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



  <!-- Wavy Section Top -->
  <section class="relative bg-gradient-to-r from-teal-400 via-teal-500 to-teal-600 text-black py-16">
    <div class="text-center">
      <h1 class="text-4xl font-bold">Hello <%= user.getName() %> 👋</h1>
      <p class="mt-2 text-lg">Welcome to your Admin Profile</p>
    </div>

    
  </section>

  <!-- Profile Section -->
  <main class="relative -mt-12 mb-20 z-10 max-w-6xl mx-auto px-6">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

      <!-- Profile Card -->
      <div class="bg-white/80 backdrop-blur-lg rounded-2xl shadow-2xl p-6 text-center border border-gray-200">
        <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-2 border-black shadow-lg mb-4">
			<img src="<%= (user.getProfile_picture_url() != null && !user.getProfile_picture_url().isEmpty()) ? user.getProfile_picture_url() : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUW0u5Eiiy3oM6wcpeEE6sXCzlh8G-tX1_Iw&s" %>" 
			    alt="Profile"
	          	class="w-full h-full object-cover"
	         />
        </div>
        <h2 class="text-2xl font-semibold text-gray-800"><%= user.getName() %></h2>
        <p class="text-gray-500 text-sm mt-1"><%= user.getGmail() %></p>
        <div class="mt-4 flex justify-center gap-4">
        <form id="uploadForm" action="UploadAdminProfileImageServlet" method="post" enctype="multipart/form-data" class="inline-block">
		  <input type="file" name="profileImage" id="profileImage" accept="image/*" class="hidden" onchange="document.getElementById('uploadForm').submit();">
		  <input type="hidden" name="userId" value="<%= user.getId() %>">
		  <button type="button" class="bg-gray-200 text-gray-800 px-4 py-1 rounded-full hover:bg-gray-300 transition" onclick="document.getElementById('profileImage').click();">Edit pic</button>
		</form>

     	<a href="updateAdmin.jsp?id=<%= user.getId() %>&name=<%= user.getName() %>&gmail=<%= user.getGmail() %>&phone=<%= user.getPhone() %>&address=<%= user.getAddress() %>&age=<%= user.getAge() %>&gender=<%= user.getGender() %>">
     		<button class="bg-gray-200 text-gray-800 px-4 py-1 rounded-full hover:bg-gray-300 transition">Edit profile</button>
   		</a>
        </div>
        <div class="mt-6 text-sm text-gray-600">
          <p><strong>User Role :</strong> <%= user.getRole() %></p>
        </div>
      </div>

      <!-- Account Info -->
      <div class="md:col-span-2 bg-white/80 backdrop-blur-lg rounded-2xl shadow-2xl p-8 border border-gray-200">
        <div class="flex justify-between items-center mb-6">
          <h3 class="text-xl font-bold text-gray-800">Account Information</h3>
          <span class="text-sm text-blue-600 hover:underline cursor-pointer">Settings</span>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-700">
          <div>
            <label class="block text-sm font-medium mb-1">Full Name</label>
            <div class="bg-gray-100 rounded px-4 py-2"><%= user.getName() %></div>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Email</label>
            <div class="bg-gray-100 rounded px-4 py-2"><%= user.getGmail() %></div>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Phone</label>
            <div class="bg-gray-100 rounded px-4 py-2">
              <%= (user.getPhone() == null || "null".equalsIgnoreCase(user.getPhone()) || user.getPhone().trim().isEmpty()) 
                  ? "-" 
                  : user.getPhone()
              %>
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Address</label>
            <div class="bg-gray-100 rounded px-4 py-2">
              <%= (user.getAddress() == null || "null".equalsIgnoreCase(user.getAddress()) || user.getAddress().trim().isEmpty()) 
                  ? "-" 
                  : user.getAddress() 
              %>
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Age</label>
            <div class="bg-gray-100 rounded px-4 py-2">
              <%= (user.getAge() == null || "null".equalsIgnoreCase(user.getAge()) || user.getAge().trim().isEmpty()) 
                  ? "-" 
                  : user.getAge() 
              %>
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Gender</label>
            <div class="bg-gray-100 rounded px-4 py-2">
              <%= (user.getGender() == null || "null".equalsIgnoreCase(user.getGender()) || user.getGender().trim().isEmpty()) 
                  ? "-" 
                  : user.getGender() 
              %>
            </div>
          </div>
        </div>

        <div class="mt-8 text-center">
          <a href="#" onclick="confirmLogout(event)" class="bg-red-500 text-white px-6 py-2 rounded-full hover:bg-red-700 transition">Logout</a>
        </div>
      </div>

    </div>
  </main>


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
