<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.medilux.model.UserModel" %>

<%
    UserModel loggedUser = (UserModel) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class="relative z-20">
  <!-- Navigation Bar -->
  <header class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center py-4">
        <a href="HomeProductServlet" class="flex items-center space-x-2">
          <i class="fa-solid fa-stethoscope text-teal-600 text-2xl"></i>
          <span class="text-xl font-bold text-teal-700">MediLux</span>
        </a>
        <nav class="hidden md:flex space-x-6 text-gray-700 text-sm font-medium">
          <a href="HomeProductServlet" class="hover:text-teal-600 transition">Home</a>

			<!-- Products Dropdown -->
			<!-- 
			<div class="relative" id="productsDropdown">
			  <a href="#" class="hover:text-teal-600 transition">Products</a>
			  <div class="absolute left-0 hidden mt-2 bg-white border border-gray-200 rounded-lg shadow-lg w-64 z-50" id="dropdownMenu">
				<a href="products.jsp?category=Baby%20%26%20Childcare" class="block px-4 py-2 text-gray-700 hover:bg-teal-100">Baby & Childcare</a>
			    <a href="products.jsp?category=Vitamins%20%26%20Supplements" class="block px-4 py-2 text-gray-700 hover:bg-teal-100">Vitamins & Supplements</a>
			    <a href="products.jsp?category=Prescription%20Medications" class="block px-4 py-2 text-gray-700 hover:bg-teal-100">Prescription Medications</a>
			    <a href="products.jsp?category=First%20Aid%20%26%20Medical%20Supplies" class="block px-4 py-2 text-gray-700 hover:bg-teal-100">First Aid & Medical Supplies</a>
			  </div>
			</div>
			 -->

          <a href="aboutUs.jsp" class="hover:text-teal-600 transition">About Us</a>
          <a href="contactUs.jsp" class="hover:text-teal-600 transition">Contact Us</a>
          <a href="GetAllProductServlet" class="hover:text-teal-600 transition">Products</a>
          <a href="UserShowAllFeedbackServlet" class="hover:text-teal-600 transition">Feedback</a>

        </nav>
        <div class="hidden md:flex space-x-4">
          <% if (loggedUser == null) { %>
          
 			<button onclick="location.href='login.jsp'" class="flex items-center px-3 py-2 border border-teal-600 text-teal-600 rounded-full hover:bg-teal-50 transition text-sm">
    			<i class="fas fa-sign-in-alt mr-2"></i>Login
  			</button>
  		  <% } else { %>
  			<div class="flex items-center space-x-4">
    			<button onclick="location.href='GetUserProfileServlet'" class="flex items-center space-x-2 bg-gray-100 px-3 py-2 rounded-full hover:bg-gray-400 hover:text-white">
      				<i class="fas fa-user text-teal-600"></i>
      				<span class="text-sm font-medium text-gray-700"><%= loggedUser.getName() %></span>
    			</button>
    			
    			
    			<!-- Cart Icon Button -->
			   <button onclick="location.href='GetCartServlet'" class="relative flex items-center px-3 py-2 bg-gray-100 rounded-full hover:bg-teal-100 transition">
			     	 <i class="fas fa-shopping-cart text-teal-600 text-lg"></i>
			   </button>
			    			
			    
			    <button type="submit" onclick="confirmLogout(event)" class="flex items-center px-3 py-2 bg-gray-100 text-black rounded-full hover:bg-black hover:text-white transition-colors duration-300 ease-in-out text-sm">
					  <i class="fas fa-sign-out-alt mr-2"></i>Logout
				</button>
  			</div>
		<% } %>

        </div>
        <div class="md:hidden">
          <button id="mobileMenuBtn" class="text-gray-600 focus:outline-none">
            <i class="fas fa-bars text-2xl"></i>
          </button>
        </div>
      </div>
    </div>
  </header>
</div>

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
