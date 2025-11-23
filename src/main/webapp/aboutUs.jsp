<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>MediLux - About Us</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-white text-gray-800 font-sans">
  <section class="relative bg-[url('https://t4.ftcdn.net/jpg/01/18/42/59/360_F_118425925_n2GZJR42P1ai0p3qYmNe375LCd6kQ9R4.jpg')] bg-cover bg-center bg-no-repeat">
    <div class="bg-black bg-opacity-60">
      <div class="max-w-7xl mx-auto px-6 py-20 text-white text-center">
        <h1 class="text-4xl md:text-5xl font-bold mb-6">About MediLux</h1>
        <p class="text-lg md:text-xl max-w-3xl mx-auto">
          At <span class="text-teal-400 font-semibold">MediLux</span>, we're committed to transforming how people access and manage their medication. With just a few clicks, our platform ensures safe, quick, and reliable drug deliveries — anytime, anywhere.
        </p>
      </div>
    </div>
  </section>

  <section class="max-w-6xl mx-auto px-6 py-16">
    <div class="grid md:grid-cols-2 gap-12 items-center">
      <img src="https://t4.ftcdn.net/jpg/02/81/42/77/360_F_281427785_gfahY8bX4VYCGo6jlfO8St38wS9cJQop.jpg" alt="MediLux Mission" class="rounded-2xl shadow-lg">
      <div>
        <h2 class="text-3xl font-bold text-teal-700 mb-4">Our Mission</h2>
        <p class="text-lg text-gray-700">
          MediLux was born to make healthcare more accessible through technology. Our mission is to make medication ordering seamless, secure, and affordable for everyone, especially for those who struggle with mobility or time.
        </p>
        <ul class="mt-6 space-y-3 text-gray-600">
          <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> 24/7 Online Ordering</li>
          <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> Verified & Trusted Pharmacies</li>
          <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> Fast Delivery & Real-Time Tracking</li>
        </ul>
      </div>
    </div>
  </section>

  <section class="bg-gray-50 py-16">
    <div class="max-w-5xl mx-auto text-center">
      <h3 class="text-2xl font-semibold text-teal-700 mb-4">Why Choose MediLux?</h3>
      <p class="text-gray-700 text-lg">
        With our user-centric platform, dedicated support team, and verified medical partners, we offer more than just a delivery service — we offer peace of mind. Trusted by thousands, MediLux is your modern healthcare companion.
      </p>
    </div>
  </section>
  
  
  <%@ include file="footer.jsp" %>
</body>
</html>
