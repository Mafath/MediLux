<!-- hehe -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Medilux - Register</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="relative bg-white min-h-screen overflow-hidden">

   <%@ include file="header.jsp" %>


  <!-- Layered Wave Background -->
  <div class="absolute top-0 right-0 w-full h-full z-0">
    <svg class="absolute top-0 right-0 w-full h-full" viewBox="0 0 1440 600" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill="#ccfbf1" fill-opacity="1" d="M0,320 C240,400 320,200 600,300 C900,400 1000,100 1440,300 L1440,0 L0,0 Z"></path>
      <path fill="#99f6e4" fill-opacity="0.9" d="M0,400 C280,500 400,300 700,400 C1000,500 1100,200 1440,400 L1440,0 L0,0 Z"></path>
      <path fill="#5eead4" fill-opacity="0.8" d="M0,480 C300,580 480,350 800,450 C1100,550 1200,250 1440,500 L1440,0 L0,0 Z"></path>
      <path fill="#2dd4bf" fill-opacity="0.7" d="M0,560 C350,620 600,400 900,500 C1200,600 1300,350 1440,600 L1440,0 L0,0 Z"></path>
    </svg>
  </div>
  
    
  

  <!-- Main Container -->
<div class="relative z-10 flex flex-col md:flex-row items-center justify-center min-h-screen px-4 py-0 md:px-0 md:py-0">

    <!-- Left Side Text -->
    <div class="w-full md:w-1/2 text-center md:text-left mb-6 md:mb-0">
      <h1 class="text-4xl font-extrabold text-teal-800 mb-4">JOIN US</h1>
      <p class="text-gray-700 mb-6 max-w-md mx-auto md:mx-0">
        Create your Medilux account today to enjoy secure online pharmacy access, 24/7 support, and reliable medicine delivery.
      </p>
      <button class="bg-teal-600 text-white px-6 py-2 rounded-lg font-medium hover:bg-teal-700 transition">
        Learn More
      </button>
    </div>

    <!-- Right Side Form -->
    <div class="w-full md:w-1/2 max-w-md bg-white bg-opacity-80 backdrop-blur-lg shadow-xl rounded-xl p-6 md:p-8">
      <h2 class="text-2xl font-semibold text-teal-700 mb-6 text-center">Create Your Account</h2>
      <form action="UserInsertServlet" method="post" class="space-y-4">
        <div>
          <label for="name" class="block text-gray-700 mb-1">Name</label>
          <input type="text" name="name" id="name" required
                 class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-teal-400 focus:outline-none" />
        </div>
        <div>
          <label for="gmail" class="block text-gray-700 mb-1">Email</label>
          <input type="email" name="gmail" id="gmail" required
                 class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-teal-400 focus:outline-none" />
        </div>
        <div>
          <label for="password" class="block text-gray-700 mb-1">Password</label>
          <input type="password" name="password" id="password" required
			   pattern=".{6,}" title="Password must be at least 6 characters"
			   class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-teal-400 focus:outline-none" />     
        </div>
        
        
         <!-- Email error display -->
          <%
              String error = (String) request.getAttribute("error");
              if (error != null) {
          %>
            <p class="mt-1 text-sm text-red-400"><%= error %></p>
          <%
              }
          %>
        
        
        
        <button type="submit"
                class="w-full bg-teal-600 text-white font-semibold py-2 rounded-lg hover:bg-teal-700 transition">
          Register
        </button>
        
        <!-- Added Login Link -->
		<p class="text-center text-gray-700 mt-4">
		  Already have an account? 
		  <a href="login.jsp" class="text-teal-600 font-semibold hover:underline">Login</a>
		</p>

      </form>
    </div>

  </div>
</body>
</html>
