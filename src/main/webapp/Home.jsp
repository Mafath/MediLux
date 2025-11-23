<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
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
  <title>MediLux - Home</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
</head>
<body class="bg-gray-100">


  <%@ include file="header.jsp" %>
  

  <!-- Hero Section with Slider -->
 	<section x-data="{
      activeSlide: 0,
      slides: [
        {
          image: 'Assets/pexels-pixabay-161688.jpg',
          title: 'Get Medicines Delivered Fast',
          subtitle: 'Order your prescriptions from the comfort of your home.'
        },
        {
          image: 'Assets/pexels-shvetsa-3786157.jpg',
          title: 'Trusted by Thousands of Patients',
          subtitle: 'Affordable, reliable, and professional healthcare products.'
        },
        {
          image: 'Assets/pexels-polina-tankilevitch-3873176.jpg',
          title: 'Your Health is Our Priority',
          subtitle: 'Browse through hundreds of verified medical products.'
        }
      ],
      next() {
        this.activeSlide = (this.activeSlide + 1) % this.slides.length
      },
      prev() {
        this.activeSlide = (this.activeSlide - 1 + this.slides.length) % this.slides.length
      },
      init() {
        setInterval(() => this.next(), 5000)
      }
    }"
    x-init="init"
    class="relative overflow-hidden h-[450px]">
    <!-- Slides -->
    <template x-for="(slide, index) in slides" :key="index">
      <div x-show="activeSlide === index"
           x-transition:enter="transition-opacity duration-1000"
           x-transition:enter-start="opacity-0"
           x-transition:enter-end="opacity-100"
           x-transition:leave="transition-opacity duration-500"
           x-transition:leave-start="opacity-100"
           x-transition:leave-end="opacity-0"
           class="absolute inset-0 h-full w-full">
        <img :src="slide.image" alt="Slide Image" class="w-full h-full object-cover" />
        <div class="absolute top-0 left-0 h-full w-full bg-black/40 flex items-center">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
            <div class="text-white max-w-xl">
              <h2 class="text-3xl sm:text-4xl lg:text-5xl font-bold mb-4" x-text="slide.title"></h2>
              <p class="text-lg sm:text-xl font-light" x-text="slide.subtitle"></p>
            </div>
          </div>
        </div>
      </div>
    </template>

    <!-- Navigation Buttons -->
    <div class="absolute top-1/2 left-4 transform -translate-y-1/2 z-10">
      <button @click="prev" class="bg-white text-teal-600 p-2 rounded-full shadow hover:bg-teal-100">
        <i class="fas fa-chevron-left"></i>
      </button>
    </div>
    <div class="absolute top-1/2 right-4 transform -translate-y-1/2 z-10">
      <button @click="next" class="bg-white text-teal-600 p-2 rounded-full shadow hover:bg-teal-100">
        <i class="fas fa-chevron-right"></i>
      </button>
    </div>
  </section>


<!-- Featured Products Section -->
<section class="py-12 bg-white pt-24">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <h2 class="text-3xl font-bold text-red-800 mb-8 text-center">Featured Products</h2>

    <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-4">
      <c:forEach var="product" items="${featuredProducts}">
        <div class="bg-white shadow-md rounded-lg overflow-hidden hover:shadow-lg transition-all duration-300 text-sm">
          <img src="Featured products/${product.getProduct_img()}" alt="${product.getProduct_title()}" class="w-full h-36 object-cover">
          <div class="p-3">
            <h3 class="text-md font-semibold text-gray-800 truncate">${product.getProduct_title()}</h3>
            <p class="text-sm text-teal-700 mt-1">Rs. ${product.getProduct_price()}</p>
          </div>
        </div>
      </c:forEach>
    </div>

    <div class="flex justify-end">
      <a href="GetAllProductServlet" class="bg-teal-600 text-white px-5 py-2 text-sm rounded-full hover:bg-teal-700 transition shadow">
        View All Products
      </a>
    </div>
  </div>
</section>

  
  
  <!-- Why Choose Us Section -->
<section class="py-12 bg-white pb-28">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
    <h2 class="text-3xl font-bold text-gray-800 mb-4">Why Choose MediLux?</h2>
    <p class="text-gray-600 text-lg mb-10">We’re committed to making healthcare simple, accessible, and affordable.</p>
    
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
      <div class="bg-white p-6 rounded-xl shadow hover:shadow-md transition">
        <i class="fas fa-truck text-teal-600 text-3xl mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800 mb-2">Fast Delivery</h3>
        <p class="text-sm text-gray-600">Same-day or next-day delivery options available in major cities.</p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow hover:shadow-md transition">
        <i class="fas fa-capsules text-teal-600 text-3xl mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800 mb-2">Wide Range</h3>
        <p class="text-sm text-gray-600">Choose from 1000+ prescription and OTC medicines.</p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow hover:shadow-md transition">
        <i class="fas fa-user-md text-teal-600 text-3xl mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800 mb-2">Verified by Experts</h3>
        <p class="text-sm text-gray-600">All products are checked and verified by licensed pharmacists.</p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow hover:shadow-md transition">
        <i class="fas fa-credit-card text-teal-600 text-3xl mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800 mb-2">Secure Payments</h3>
        <p class="text-sm text-gray-600">Multiple secure payment options, including COD.</p>
      </div>
    </div>
  </div>
</section>


<!-- Testimonials Section -->
<!--
<section class="bg-white py-12">
  <div class="max-w-7xl mx-auto px-4 text-center">
    <h2 class="text-3xl font-bold text-gray-800 mb-10">What Our Customers Say</h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      
      <div class="bg-gray-50 p-6 rounded-xl shadow">
        <p class="text-sm text-gray-600 italic">"Quick delivery and genuine products. The best online medical store I've used."</p>
        <div class="mt-4 text-teal-600 font-semibold">— Anjali D.</div>
      </div>

      <div class="bg-gray-50 p-6 rounded-xl shadow">
        <p class="text-sm text-gray-600 italic">"Their customer service is top-notch. Helped me with my prescription without delay."</p>
        <div class="mt-4 text-teal-600 font-semibold">— Rahul K.</div>
      </div>

      <div class="bg-gray-50 p-6 rounded-xl shadow">
        <p class="text-sm text-gray-600 italic">"Very affordable prices and quality medicines. Highly recommended."</p>
        <div class="mt-4 text-teal-600 font-semibold">— Fatima S.</div>
      </div>
    </div>
  </div>
</section>
-->



<!-- Newsletter Section -->
<section class="bg-teal-600 py-10 text-white">
  <div class="max-w-4xl mx-auto px-4 text-center">
    <h2 class="text-2xl sm:text-3xl font-bold mb-3">Stay Updated!</h2>
    <p class="mb-6">Subscribe to our newsletter for health tips and latest offers.</p>
    <form class="flex flex-col sm:flex-row items-center justify-center gap-4">
      <input type="email" placeholder="Enter your email" class="px-4 py-2 rounded-full text-gray-800 w-full sm:w-1/2 focus:outline-none" />
      <button class="bg-white text-teal-600 font-semibold px-6 py-2 rounded-full hover:bg-gray-100">Subscribe</button>
    </form>
  </div>
</section>

  



   <%@ include file="footer.jsp" %>
  
  
  

</body>
</html>
    