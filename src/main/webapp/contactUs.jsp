<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>MediLux - Contact Us</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-800 font-sans">
  <section class="bg-gradient-to-br from-teal-100 to-white py-20 px-6">
    <div class="max-w-5xl mx-auto">
      <div class="text-center mb-12">
        <h1 class="text-4xl font-bold text-teal-700 mb-2">Contact Us</h1>
        <p class="text-lg text-gray-600">Have questions or feedback? We’d love to hear from you.</p>
      </div>

      <div class="grid md:grid-cols-2 gap-12">
        <div class="space-y-6">
          <div>
            <h3 class="text-xl font-semibold text-teal-600">📍 Address</h3>
            <p class="text-gray-700">123 MediLux Avenue, HealthTech City, HL 45800</p>
          </div>
          <div>
            <h3 class="text-xl font-semibold text-teal-600">📞 Phone</h3>
            <p class="text-gray-700">+94 11 45 84 235</p>
          </div>
          <div>
            <h3 class="text-xl font-semibold text-teal-600">📧 Email</h3>
            <p class="text-gray-700">support@medilux.com</p>
          </div>
        </div>

        <form action="#" method="post" class="bg-white p-8 rounded-xl shadow-lg space-y-6">
          <div>
            <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Your Name</label>
            <input type="text" name="name" id="name" required class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
          </div>
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
            <input type="email" name="email" id="email" required class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
          </div>
          <div>
            <label for="message" class="block text-sm font-medium text-gray-700 mb-1">Message</label>
            <textarea name="message" id="message" rows="4" required class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500"></textarea>
          </div>
          <button type="submit" class="w-full bg-teal-600 text-white py-2 rounded-lg hover:bg-teal-700 transition">Send Message</button>
        </form>
      </div>
    </div>
  </section>
  
  <%@ include file="footer.jsp" %>
  
</body>
</html>
