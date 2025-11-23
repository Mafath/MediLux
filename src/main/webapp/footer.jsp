<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="relative z-20">


	<!--Footer -->
	<footer class="bg-gray-900 text-gray-200 pt-12 pb-8">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
  
        <!-- Brand -->
        <div>
          <h2 class="text-2xl font-bold text-teal-400 mb-2">MediLux</h2>
          <p class="text-sm text-gray-400">Delivering premium care, always on time.</p>
        </div>
  
        <!-- Quick Links -->
        <div>
          <h3 class="text-lg font-semibold text-white mb-4">Quick Links</h3>
          <ul class="space-y-2">
            <li><a href="HomeProductServlet" class="hover:text-teal-400 transition">Home</a></li>
            <li><a href="aboutUs.jsp" class="hover:text-teal-400 transition">About Us</a></li>
            <li><a href="UserShowAllFeedbackServlet" class="hover:text-teal-400 transition">Feedback</a></li>
            <li><a href="contactUs.jsp" class="hover:text-teal-400 transition">Contact</a></li>
          </ul>
        </div>
  
        <!-- Categories -->
        <div>
          <h3 class="text-lg font-semibold text-white mb-4">Categories</h3>
          <ul class="space-y-2">
            <li><a href="GetAllProductServlet" class="hover:text-teal-400 transition">Baby Care</a></li>
            <li><a href="GetAllProductServlet" class="hover:text-teal-400 transition">Vitamins</a></li>
            <li><a href="GetAllProductServlet" class="hover:text-teal-400 transition">First Aid</a></li>
            <li><a href="GetAllProductServlet" class="hover:text-teal-400 transition">Supplements</a></li>
            
          </ul>
        </div>

        <!-- Contact -->
        <div>
            <h3 class="text-lg font-semibold text-white mb-4">Contact</h3>
            <p class="text-sm flex items-start space-x-2">
            <i class="fas fa-map-marker-alt mt-1 text-teal-400"></i>
            <span>123 MedStreet, Wellness City, 560001</span>
            </p>
            <p class="text-sm mt-2 flex items-start space-x-2">
            <i class="fas fa-envelope mt-1 text-teal-400"></i>
            <a href="mailto:support@medilux.com" class="hover:text-teal-400">support@medilux.com</a>
            </p>
            <p class="text-sm mt-2 flex items-start space-x-2">
            <i class="fas fa-phone mt-1 text-teal-400"></i>
            <a href="tel:+919000000000" class="hover:text-teal-400">+91 90000 00000</a>
            </p>
        
            <!-- Payment Methods -->
            <div class="mt-6">
                <p class="text-sm text-white font-semibold mb-2">We accept</p>
                <div class="flex space-x-4 items-center">
                <i class="fab fa-cc-visa text-2xl" style="color:#1A1F71;"></i>
                <i class="fab fa-cc-mastercard text-2xl" style="color:#EB001B;"></i>
                <i class="fab fa-cc-paypal text-2xl" style="color:#003087;"></i>
                <i class="fab fa-cc-amex text-2xl" style="color:#2E77BB;"></i>
                </div>
            </div>
  
        </div>
  
      </div>
  
      <!-- Divider -->
      <div class="border-t border-gray-700 mt-10 pt-6 flex flex-col sm:flex-row justify-between items-center">
        <p class="text-sm text-gray-500">&copy; 2025 MediLux. All rights reserved.</p>
  
        <!-- Socials -->
        <div class="flex space-x-4 mt-4 sm:mt-0">
          <a href="#" class="hover:text-teal-400 transition"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="hover:text-teal-400 transition"><i class="fab fa-twitter"></i></a>
          <a href="#" class="hover:text-teal-400 transition"><i class="fab fa-instagram"></i></a>
          <a href="#" class="hover:text-teal-400 transition"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>
    </div>
  </footer>
  
  </div>
  

</body>
</html>